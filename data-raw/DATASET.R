#Here's the data we want in our package:
food_data <- readr::read_csv("data-raw/food.csv")
food_data <- dplyr::select(food_data, c("comfort_food", "food_childhood", "meals_dinner_friend"))

mouse_data_birth <- readxl::read_excel("data-raw/mouseData.xlsx", sheet = 1)
mouse_data_bw_dirty <- readxl::read_excel("data-raw/mouseData.xlsx", sheet = 2)
mouse_data_bw_clean <- readxl::read_excel("data-raw/mouseData.xlsx", sheet = 4)

#print(mouseDataBirth)
#print(mouseDataBodyWeight)
usethis::use_data(food_data, mouse_data_birth, mouse_data_bw_dirty, mouse_data_bw_clean, overwrite = TRUE)
