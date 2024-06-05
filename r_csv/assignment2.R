#open rvest package
library(rvest)

# Define the URL of the Wikipedia page
url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Read the HTML content of the page
page <- read_html(url)

# Extract the CSV example from the page
csv_table <- page %>% html_nodes("pre") %>% html_text() %>% .[grepl("Year,Make,Model,Description,Price", .)]

# Split the CSV text into lines
csv_splitline <- strsplit(csv_table, "\n")[[1]]

# Split each line into fields and convert to a data frame
csv_info <- do.call(rbind, lapply(csv_splitline, function(x) strsplit(x, ",")[[1]]))
csvframe <- as.data.frame(csv_info, stringsAsFactors = FALSE)

# Set the first row as column names and remove it from the data
colnames(csvframe) <- csvframe[1, ]
csvframe <- csvframe[-1, ]

# Create a folder to save the CSV file
dir.create("r_csv", showWarnings = FALSE)

# Save the data frame to a CSV file
write.csv(csvframe, file = "r_csv/vehicle.csv", row.names = FALSE)

cat("CSV file has been saved.\n")

# Displaying the data
print(csvframe)

# Displaying the data through the file
library(knitr)

data <- read.csv("vehicle.csv")
subset_data <- head(data)
print(subset_data)






