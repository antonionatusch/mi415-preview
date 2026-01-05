# Load csv
import pandas as pd
import matplotlib.pyplot as plt

# Load data
data = pd.read_csv("../../data/problem_9_data.csv", header=None)

# Convert to dataframe to then calculate moving average with n = 10
df = pd.DataFrame(data)
df.columns = ["values"]
window_size = 10
df["moving_average"] = df["values"].rolling(window=window_size).mean()
# Just to check if it gets same values as Typst
# print(df["moving_average"].head(25))

# Plot original data overlapped by moving average with line plot with markers
plt.figure(figsize=(12, 6))
plt.plot(
    df.index,
    df["values"],
    label="Datos Originales",
    marker="o",
    markersize=4,
    linestyle="-",
    alpha=0.5,
)
plt.plot(
    df.index,
    df["moving_average"],
    label=f"Promedio Móvil $(n = {window_size})$",
    color="red",
    linewidth=2,
)
plt.title(rf"Datos Originales y Promedio Móvil $(n = {window_size})$")
plt.xlabel("Índice $i$")
plt.ylabel("Valores")
plt.legend()
plt.grid()
# Save plot
plt.savefig("moving_average_plot.png")
