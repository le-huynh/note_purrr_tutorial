#'---
#' output:
#'     html_document:
#'       keep_md: TRUE
#'---

#+ message=FALSE
library(tidyverse)
library(repurrrsive)

#' ### Name and position shortcuts
names(got_chars[[1]])

got_chars %>% map("name")

got_chars %>% map(3)

#' ### Type-specific map  
#' Use a type-specific form of map() and an extraction shortcut to 
#' extract these ids into an integer vector
got_chars %>% map_int("id")

got_chars %>% map("id")

#' Use your list inspection strategies to find the list element that is logical
got_chars[[1]] %>% map(is.logical)

#' Use a type-specific form of map() and an extraction shortcut to 
#' extract these values for all characters into a logical vector
got_chars %>% map_lgl("alive")

#' ### Extract multiple values
got_chars %>% map(`[`, c("name", "gender", "born"))

got_chars %>% map(`[`, c(3, 4, 6))

got_chars %>% map(magrittr::extract, c("name", "gender", "born"))

got_chars %>% map(magrittr::extract, c(3, 4, 6))

#' ### Data frame output
got_chars %>% map_dfr(`[`, c("id", "name", "gender", "alive"))

got_chars %>% tibble(id = map_int(., "id"),
		 name = map_chr(., "name"))

got_chars %>% {tibble(id = map_int(., "id"),
		  name = map_chr(., "name"))}

