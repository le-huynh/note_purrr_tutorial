#'---
#' title: Parallel mapping
#' output:
#'     html_document:
#'       keep_md: TRUE
#'---

#+ message=FALSE
library(tidyverse)
library(repurrrsive)

#' ## Three more ways to specify general .f:
#' - an existing function
#' - an anonymous function, defined on-the-fly
#' - a formula: unique to purrr
df <- got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name"))

(df2 <- df[c("Sansa Stark", "Arya Stark", "Brandon Stark")])

#' an existing function
myfunc = function(x) paste(x, collapse = " | ")

df2 %>% map(myfunc)

#' an anonymous function
df2 %>% map(function(x) paste(x, collapse = " | "))

df2 %>% map(paste, collapse = " | ")

#' a formula: `.` = an individual element of the primary vector or list
df2 %>% map(~ paste(., collapse = " | "))

#' List `got_chars`: pull out aliases of each character
got_chars %>% 
	map("aliases")

got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name"))

got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name")) %>%
	enframe("name", "aliases")

got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name")) %>%
	enframe("name", "aliases") %>%
	unnest(aliases)

#' ## Exercises
got_chars %>% 
	map("allegiances") %>%
	set_names(map_chr(got_chars, "name"))

got_chars %>% 
	map("allegiances") %>%
	set_names(map_chr(got_chars, "name")) %>%
	map(~ paste(., collapse = " | ")) %>%
	enframe("name", "allegiances") %>%
	unnest("allegiances")

#' # Parallel map:
#' ## `map2()`
(nms <- got_chars %>% map_chr("name"))

(birth <- got_chars %>% map_chr("born"))

map2(nms, birth, function(x, y) paste(x, "was born", y))

map2(nms, birth, ~ paste(.x, "was born", .y))

#' ## `pmap()`
#' `name` has x `aliases` and y `allegiances`
(name <- got_chars %>% map_chr("name"))

(aliases <- got_chars %>% map("aliases") %>% map_int(., length))

(allegiances <- got_chars %>% map("allegiances") %>% map_int(., length))

paste(name, "has", aliases, "aliases and", allegiances, "allegiances")

