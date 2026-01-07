# Load csv
import pandas as pd
import matplotlib.pyplot as plt
import argparse

# Load data from csv path established by CLI args
parser = argparse.ArgumentParser(
    description="Plot moving average and original values of a specified column from a CSV file."
)
parser.add_argument(
    "csv_path", type=str, help="Path to the CSV file containing the data."
)

parser.add_argument(
    "--window_size", type=str, help="Window size for the moving average (default: 10)"
)

parser.add_argument(
    "--column_index",
    type=int,
    default=0,
    help="Index of the column to process (default: 0).",
)
parser.add_argument(
    "--output_path",
    type=str,
    default="moving_average_plot.png",
    help="Path to save the output plot (default: moving_average_plot.png).",
)

parser.add_argument(
    "--with_header",
    action="store_true",
    help="Specify if the CSV file has a header row.",
)

args = parser.parse_args()
csv_path = args.csv_path
column_index = args.column_index
output_path = args.output_path
with_header = args.with_header
window_size = int(args.window_size) if args.window_size else 10

# Error handling if user forgets to specify header when csv has one

try:
    pd.read_csv(csv_path, header=0)
    csv_has_header = True
except pd.errors.ParserError:
    csv_has_header = False
if with_header != csv_has_header:
    raise ValueError(
        f"Header mismatch: CSV has header = {csv_has_header}, but with_header argument is {with_header} or not provided."
    )


has_header = 1 if with_header else None

values = pd.read_csv(csv_path, header=has_header).iloc[:, column_index].tolist()

# Create DataFrame
df = pd.DataFrame(values)
df.columns = ["values"]
df["moving_average"] = df["values"].rolling(window=window_size).mean()

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
plt.savefig(output_path)
