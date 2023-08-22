import numpy as np
import matplotlib.pyplot as plt

# Unipolar Non Return to Zero Line Coding
N = 10  # Number of bits
n = np.array([1, 0, 1, 1, 0, 1, 1, 0, 0, 1])
# n = np.random.randint(2, size=N)  # Random bit generation

# Mapping Function
nn = np.zeros(N)
for m in range(N):
    if n[m] == 1:
        nn[m] = 1
    else:
        nn[m] = 0

print(nn)

# Signal Shaping
i = 0
t = np.arange(0, len(n), 0.01)  # 100 Times duration set up for a single binary bit
y = np.zeros(len(t))

for j in range(len(t)):  # Indexing set-up for time duration
    if t[j] <= i:  # Binary input data index Check-up Condition
        y[j] = nn[i]  # Assign value from the mapping function
    else:
        y[j] = nn[i]
        i += 1  # Binary input data index increment

plt.plot(t, y, linewidth=2)
plt.axis([0, N, -1.5, 1.5])  # Axis set-up
plt.grid()
plt.title("Unipolar NZR Signaling")
plt.xlabel("Time (bit periods)")
plt.ylabel("Amplitude")
plt.show()
