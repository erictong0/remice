#' Analyze the Type of a Column
#'
#' Takes a column from a dataframe and returns a table that shows any rows that are not able to be coerced into the specified type.
#' This includes any entries that are NA.
#'
#' @param data The name of the dataset you are working with
#' @param col_name The name of the column in the dataset, expressed as a string
#' @param data_type The data type you are looking for. This should be one of the four strings: "integer", "numeric", "boolean", or "character"
#'
#' @return A table displaying all of the columns that are unable to be coerced into the chosen type
#'
#' @examples
#' analyze_type(mouse_data_bw_dirty, "Body Weight 3", "numeric")
#'
#' @export
analyze_type <- function(data, col_name, data_type){

  #Makes sure the data type inputted is acceptable
  data_type <- tolower(data_type)
  if(!(data_type %in% c("integer", "numeric", "boolean", "character"))){
    stop("The data_type needs to be one of \"integer\", \"numeric\", \"boolean\", or \"character\"")
  }

  #Ensures the column exists in the data
  if (!col_name %in% colnames(data)) {
    stop(paste("Column \"", col_name, "\" not found in the data", sep = ""))
  }

  original_cols <- data[[col_name]]
  changed_cols <- data[[col_name]]

  if(data_type == "integer"){
    changed_cols <- suppressWarnings(as.integer(changed_cols))
  } else if(data_type == "numeric"){
    changed_cols <- suppressWarnings(as.numeric(changed_cols))
  } else if(data_type == "boolean"){
    changed_cols <- suppressWarnings(as.logical(changed_cols))
  } else if(data_type == "character"){
    changed_cols <- suppressWarnings(as.character(changed_cols))
  } else{
    stop("Unexpected error: data_type was not recognized.")
  }

  wrong_rows <- which(is.na(changed_cols))

  wrong_frame <- data.frame(
    row = wrong_rows,
    value = original_cols[wrong_rows]
  )

  # Create a `gt` table
  failed_table <- wrong_frame |>
    gt::gt() |>
    gt::tab_header(
      title = paste("Rows that are not ", data_type)
    ) |>
    gt::cols_label(
      row = "Row Number",
      value = "Value"
    ) |>
    gt::opt_table_outline()

  failed_table
}
