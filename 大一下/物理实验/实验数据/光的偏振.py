import matplotlib.pyplot as plt
import numpy as np
import io
plt.rcParams["font.family"] = ["SimHei", "WenQuanYi Micro Hei", "Heiti TC"]

data_string = """
0	0
10	0.034
20	0.119
30	0.266
40	0.42
50	0.588
60	0.74
70	0.856
80	0.922
90	0.942
100	0.902
110	0.898
120	0.853
130	0.764
140	0.639
150	0.507
160	0.367
170	0.238
180	0.13
190	0.066
200	0.053
210	0.087
220	0.17
230	0.278
240	0.423
250	0.565
260	0.713
270	0.82
280	0.887
290	0.912
300	0.877
310	0.787
320	0.658
330	0.519
340	0.362
350	0.233
360 0.000
"""

# 将字符串数据解析为角度和半径列表
angles_degrees = []
radii = []
for line in data_string.strip().split('\n'):
    parts = line.split()
    angles_degrees.append(float(parts[0]))
    radii.append(float(parts[1]))

# 将角度从度转换为弧度
angles_radians = np.deg2rad(angles_degrees)

# 创建极坐标图
plt.figure(figsize=(8, 8)) 
ax = plt.subplot(111, projection='polar')

# 绘制数据点，并连接它们
ax.plot(angles_radians, radii, marker='o', linestyle='-')

# (可选) 设置标题
ax.set_title("玻片角度0°：I-α图", va='bottom')

# (可选) 设置径向轴的标签位置和角度轴的刻度
ax.set_theta_zero_location("N")  # 将0度设置在顶部
ax.set_theta_direction(-1)      # 将角度设置为顺时针方向

# (可选) 添加网格
ax.grid(True)

# 显示图像
plt.show()