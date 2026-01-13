import os

import numpy as np
from matplotlib import pyplot as plt
from sklearn.model_selection import train_test_split
from torch import optim
from torch.utils.data import TensorDataset, DataLoader
import torch
import torch.nn as nn
import torch.nn.functional as F

def load_cifar10(data_dir):
    import pickle
    train_data, train_labels = [], []
    for i in range(1, 6):
        file_path = os.path.join(data_dir, f"data_batch_{i}")
        with open(file_path, 'rb') as f:
            batch = pickle.load(f, encoding='latin1')
            train_data.extend(batch['data'])
            train_labels.extend(batch['labels'])

    test_file = os.path.join(data_dir, "test_batch")
    with open(test_file, 'rb') as f:
        test_batch = pickle.load(f, encoding='latin1')
        test_data = test_batch['data']
        test_labels = test_batch['labels']

    return (train_data, train_labels), (test_data, test_labels)


def load_data():
    (train_data, train_labels), (test_data, test_labels) = load_cifar10('./cifar-10-batches-py')
    # 转换为 NumPy 数组并归一化
    train_imgs = np.array(train_data).reshape(-1, 3, 32, 32).transpose(0, 2, 3, 1)  # (N, H, W, C)
    test_imgs = np.array(test_data).reshape(-1, 3, 32, 32).transpose(0, 2, 3, 1)  # (N, H, W, C)
    train_imgs, test_imgs = train_imgs/255.0, test_imgs/255.0  # 归一化

    # 从训练集划分 20% 作为验证集 (stratified split)
    train_imgs, val_imgs, train_labels, val_labels = train_test_split(
        train_imgs, train_labels,
        test_size=0.2,
        random_state=42,  # 固定随机种子确保可复现
        stratify=train_labels  # 保持类别比例一致
    )
    return (train_imgs, train_labels), (val_imgs, val_labels), (test_imgs, test_labels)

def plot_datasets(images, labels, num : int):
    """
    画出train数据集上前num个图片
    :param num:
    :return:
    """
    class_names = ['airplane', 'automobile', 'bird', 'cat', 'deer','dog', 'frog', 'horse', 'ship', 'truck']
    plt.figure(figsize=(20, 10))
    for i in range(num):
        # 将整个figure分成(num/10 + 1) 行, 10列
        plt.subplot(int(num/10 + 1), 10, i+1)
        # 设置不显示x轴刻度
        plt.xticks([])
        # 设置不显示y轴刻度
        plt.yticks([])
        # 设置不显示子图网格线
        plt.grid(False)
        plt.imshow(images[i],  cmap=plt.cm.binary)
        plt.xlabel(class_names[labels[i][0]])
    plt.show()


class CNN(nn.Module):
    def __init__(self):
        super(CNN, self).__init__()
        self.conv1 = nn.Conv2d(3, 32, kernel_size=3)  # [3,32,32] => [32,30,30]
        self.pool1 = nn.MaxPool2d(2, 2)  # [32,30,30] => [32,15,15]
        self.conv2 = nn.Conv2d(32, 64, kernel_size=3)  # [32,15,15] => [64,13,13]
        self.pool2 = nn.MaxPool2d(2, 2)  # [64,13,13] => [64,6,6]
        self.conv3 = nn.Conv2d(64, 64, kernel_size=3)  # [64,6,6] => [64,4,4]

        self.flatten = nn.Flatten()  # [64,4,4] => 1024
        self.fc1 = nn.Linear(64 * 4 * 4, 64)  # 1024 => 64
        self.fc2 = nn.Linear(64, 10)  # 64 => 10

    def forward(self, x):
        """
        调用我们定义好的模块，如conv1、fc1对输入的tensor x进行处理
        """
        x = F.relu(self.conv1(x))
        x = self.pool1(x)
        x = F.relu(self.conv2(x))
        x = self.pool2(x)
        x = F.relu(self.conv3(x))

        x = self.flatten(x)
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return x


# 评估函数
def evaluate_model(model, loader, criterion):
    model.eval()
    running_loss = 0.0
    correct = 0
    total = 0

    with torch.no_grad():
        for images, labels in loader:
            # images, labels = images.to(device), labels.to(device)
            outputs = model(images)
            loss = criterion(outputs, labels)

            running_loss += loss.item()
            _, predicted = torch.max(outputs.data, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

    loss = running_loss / len(loader)
    accuracy = 100 * correct / total
    return loss, accuracy


# 训练函数
def train_model(model, train_loader, val_loader, criterion, optimizer, epochs=10):
    best_acc = 0.0
    train_losses, val_losses = [], []
    train_accs, val_accs = [], []

    for epoch in range(epochs):
        model.train()
        running_loss = 0.0
        correct = 0
        total = 0

        for images, labels in train_loader:
            # images, labels = images.to(device), labels.to(device)

            optimizer.zero_grad()
            outputs = model(images)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()

            running_loss += loss.item()
            _, predicted = torch.max(outputs.data, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

        train_loss = running_loss / len(train_loader)
        train_acc = 100 * correct / total
        train_losses.append(train_loss)
        train_accs.append(train_acc)

        # 验证阶段
        val_loss, val_acc = evaluate_model(model, val_loader, criterion)
        val_losses.append(val_loss)
        val_accs.append(val_acc)

        # 保存最佳模型
        if val_acc > best_acc:
            best_acc = val_acc
            torch.save(model.state_dict(), 'best_model.pth')

        print(f'Epoch {epoch + 1}/{epochs}: '
              f'Train Loss: {train_loss:.4f}, Train Acc: {train_acc:.2f}% | '
              f'Val Loss: {val_loss:.4f}, Val Acc: {val_acc:.2f}%')

    return train_losses, train_accs, val_losses, val_accs


# 主程序
def main():
    # 准备数据
    (train_imgs, train_labels),(val_imgs, val_labels),(test_imgs, test_labels) = load_data()

    # 转换为PyTorch张量并调整维度顺序 (N, H, W, C) -> (N, C, H, W)
    train_imgs = torch.FloatTensor(train_imgs).permute(0, 3, 1, 2)
    val_imgs = torch.FloatTensor(val_imgs).permute(0, 3, 1, 2)
    test_imgs = torch.FloatTensor(test_imgs).permute(0, 3, 1, 2)

    train_labels = torch.LongTensor(train_labels)
    val_labels = torch.LongTensor(val_labels)
    test_labels = torch.LongTensor(test_labels)

    # 创建数据集和数据加载器
    batch_size = 64
    train_dataset = TensorDataset(train_imgs, train_labels)
    val_dataset = TensorDataset(val_imgs, val_labels)
    test_dataset = TensorDataset(test_imgs, test_labels)

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
    val_loader = DataLoader(val_dataset, batch_size=batch_size)
    test_loader = DataLoader(test_dataset, batch_size=batch_size)

    # 初始化模型
    model = CNN()
    print(model)

    # 定义损失函数和优化器
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001, weight_decay=1e-4)
    # scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, 'max', patience=3, factor=0.5)

    # 训练模型
    epochs = 20
    train_losses, train_accs, val_losses, val_accs = train_model(
        model, train_loader, val_loader, criterion, optimizer, epochs
    )

    # 绘制训练曲线
    plt.figure(figsize=(12, 4))
    plt.subplot(1, 2, 1)
    plt.plot(train_losses, label='Train')
    plt.plot(val_losses, label='Validation')
    plt.title('Loss Curve')
    plt.legend()

    plt.subplot(1, 2, 2)
    plt.plot(train_accs, label='Train')
    plt.plot(val_accs, label='Validation')
    plt.title('Accuracy Curve')
    plt.legend()
    plt.show()

    # 测试最佳模型
    model.load_state_dict(torch.load('best_model.pth'))
    test_loss, test_acc = evaluate_model(model, test_loader, criterion)
    print(f'Test Accuracy: {test_acc:.2f}%')


if __name__ == '__main__':
    main()

