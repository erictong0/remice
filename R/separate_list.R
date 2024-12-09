#' Separate List
#'
#' This function takes a column of a dataset which has multiple responses in each row and separates the responses into a table
#'
#' @param data The name of the dataset
#' @param col_name The name of the column, expressed as a string
#' @param min_frequency The minimum number of times a string needs to occur before it appears in the table (Default is 1)
#' @param delimiter The various words or punctuation marks that are used to separate strings, represented as a vector (Default is c(", ", ", and",",", " and "))
#'
#' @return A table representing the most common strings in the responses
#' @examples
#' separate_list(food_data, "comfort_food", 5)
#'
#' @export

separate_list <- function(data, col_name, min_frequency = 1, delimiter = c(", ", ", and",",", " and ")){

  #Ensures the column exists in the data and is of the proper type
  if(!col_name %in% colnames(data)){
    stop(paste("Column \"", col_name, "\" not found in the data", sep = ""))
  }
  if(!is.character(data[[col_name]])){
    stop("Column should be a string")
  }

  #Extracts the column, splits it based on delimiters, and cleans it
  words <- tolower(unlist(strsplit(data[[col_name]], paste(delimiter, collapse = "|")))) |>
    trimws()
  words <- gsub("\\.", "", words)

  #Makes a table which is converted into a dataframe
  word_df <- as.data.frame(table(words))
  colnames(word_df) <- c("Word", "Frequency")
  word_df <- subset(word_df, Frequency >= min_frequency)

  #Sorts the data frame by frequency in descending order
  word_df <- word_df[order(-word_df$Frequency), ]

  #Makes the table
  gt_table <- word_df |>
    gt::gt() |>
    gt::tab_header(
      title = "Separated Word Frequencies"
    ) |>
    gt::cols_label(
      Word = "Word",
      Frequency = "Frequency"
    ) |>
    gt::opt_table_outline()

  gt_table
}
