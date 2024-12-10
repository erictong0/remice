#' Analyze String Typos
#'
#' Creates a table with rows that have different values than the rest of the other rows.
#'
#' @param data dataframe The dataframe of information
#' @param col_name character The name of column
#' @param frequency numeric The maximum number of times a string can appear before it no longer appears on the table
#'
#' @return Returns a table with a list of row numbers and strings that showed up a fewer number of times than frequency
#' @examples
#' table_different(mouse_data_birth, "Treatment", 5)
#'
#' @export

table_different <- function(data, col_name, frequency = 5){

  #Ensures the column exists in the data and is of the proper type
  if(!col_name %in% colnames(data)){
    stop(paste("Column \"", col_name, "\" not found in the data", sep = ""))
  }
  if(!is.character(data[[col_name]])){
    stop("Column should be a string")
  }

  #Makes a table which is converted into a dataframe
  freq_df <- as.data.frame(table(data[[col_name]]))
  colnames(freq_df) <- c("String", "Frequency")

  #Separates rows with lower frequency
  freq_df <- subset(freq_df, Frequency < frequency)

  #Find row numbers for inconsistent strings
  inconsistent_rows <- which(data[[col_name]] %in% freq_df$String)
  inconsistent_string_table <- data.frame(Row = inconsistent_rows, String = data[[col_name]][inconsistent_rows])


  #Outputs the table
  flagged_rows_gt <- inconsistent_string_table |>
    gt::gt() |>
    gt::tab_header(
      title = "Inconsistent Strings"
    ) |>
    gt::cols_label(
      Row = "Row Number",
      String = "String"
    ) |>
    gt::opt_table_outline()

  flagged_rows_gt
}
