#' Plot Outliers
#'
#' This function takes a longitunal dataset and finds any unusually large percent changes between datapoints in each row.
#'
#' @param data The name of the dataset
#' @param col_names A vector of column names that
#' @param threshold A number representing the percent change to classify as an "outlier" (default .2, or 20% change)
#' @param ignore_NA A boolean determining whether to ignore NA values
#'
#' @return A plot displaying each outlier plotted on a graph
#' @examples
#' plot_outliers(mouse_data_bw_clean, (c("Body Weight 1", "Body Weight 2", "Body Weight 3")), .2)
#'
#' @export

plot_outliers <- function(data, col_names, threshold = .2, ignore_NA = FALSE) {
  #Check if all specified columns exist and are of the proper type
  for(col_name in col_names){
    if(!col_name %in% colnames(data)) {
      stop(paste("Column \"", col_name, "\" not found in data", sep = ""))
    }
    temp_data <- data[[col_name]]
    if(!is.numeric(temp_data)) {
      stop(paste("Column \"", col_name, "\" is non-numeric", sep = ""))
    }
    if(sum(is.na(temp_data)) > 0 && !ignore_NA) {
      stop(paste("Column \"", col_name, "\" has NA values in row ", which(is.na(temp_data)), ": either set ignore_NA to TRUE or change the data", sep = ""))
    }
  }

  #Extracts the columns
  numeric_rows <- data |>
    dplyr::select(all_of(col_names))

  #List to store plot data
  plot_data <- list()

  #Iterates through all rows
  for(i in 1:nrow(numeric_rows)){
    row_data <- as.numeric(numeric_rows[i, ])

    # Calculate percent changes between consecutive points
    percent_changes <- diff(row_data) / row_data[-length(row_data)]

    #Ignores NA rows based on user input
    if(ignore_NA){
      percent_changes <- na.omit(percent_changes)
    }

    #Stores rows that exceed the percent change
    if(any(abs(percent_changes) > threshold)){
      plot_data[[i]] <- list(
        x = seq_along(row_data),
        y = row_data,
        row = i
      )
    }
  }

  #Initializes the plot
  plot <- plotly::plot_ly() |>
    plotly::layout(
      title = "Lines for Rows with Large Percent Changes",
      xaxis = list(title = "Index"),
      yaxis = list(title = "Values")
    )

  #Plots the plot
  for(plot_row in plot_data) {
    # Add the points
    plot <- plot |>
      plotly::add_trace(
        x = plot_row$x,
        y = plot_row$y,
        type = "scatter",
        mode = "markers+lines",
        name = paste("Row", plot_row$row),
        marker = list(size = 8),
        line = list(dash = "solid")
      )
  }

  #plot
  plot
}
