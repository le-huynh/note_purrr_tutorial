#'---
#' output:
#'     html_document:
#'       keep_md: TRUE
#'---

#+ message=FALSE
library(tidyverse)
library(tidymodels)
library(gapminder)

#' ## Dataset `gapminder`
#' Identify the type of each column
gapminder %>% map_chr(class)

#' Identify the number of distinct values in each column
gapminder %>% map_dbl(n_distinct)

#' Form a dataframe: type of class, number of distinct values
gapminder %>% map_df(~ (data.frame(class = class(.x),
			    n_distinct = n_distinct(.x))))

gapminder %>% {
	tibble(class = map_chr(., class),
	       n_distinct = map_dbl(., n_distinct))
	}

#' Add variable names
gapminder %>% map_df(~ (data.frame(class = class(.x),
			     n_distinct = n_distinct(.x))),
		 .id = "variable")

#' ## Maps with multiple input objects
#' Create a *list of plots* that compare life expectancy and GDP per capita 
#' for each continent-year combination  
#' Example for 1 plot:
gapminder %>%
	filter(continent == "Asia", year == 1952) %>%
	ggplot(aes(x = gdpPercap, y = lifeExp)) + 
	geom_point() +
	labs(title = "Asia 1952")

(continent <- gapminder %>% 
	distinct(continent, year) %>% 
	pull(continent) %>% 
	as.character())

(year <- gapminder %>% 
	distinct(continent, year) %>% 
	pull(year))

(.x <- continent[1])
(.y <- year[1])

gapminder %>%
	filter(continent == .x, year == .y) %>%
	ggplot(aes(x = gdpPercap, y = lifeExp)) + 
	geom_point() +
	labs(title = glue::glue(.x, " ", .y))

#' Using `map2()`
plot <- map2(.x = continent,
	   .y = year,
	   .f = ~ {
     	gapminder %>%
     		filter(continent == .x, year == .y) %>%
     		ggplot(aes(x = gdpPercap, y = lifeExp)) + 
     		geom_point() +
     		labs(title = glue::glue(.x, " ", .y))
     })

plot[[1]]

plot[[10]]

#' ## List columns and Nested data frames
#' ### `dplyr::pluck()`: extract x-th entry from the data column
(nest_continent <- gapminder %>%
		group_by(continent) %>%
		nest())

nest_continent$data[[1]]

nest_continent %>% pluck("data", 1)

#' Calculate the average life expectancy within each continent, 
#' add it as a new column
gapminder %>%
	group_by(continent) %>%
	summarise(avg_lifeExp = mean(lifeExp))

# For one continent
(.x <- nest_continent %>% pluck("data", 1))
mean(.x$lifeExp)

# Using `map()`
(nest_continent %>%
	mutate(avg_lifeExp = map_dbl(data, ~ mean(.x$lifeExp))))

#' ### fit a model separately for each continent, and evaluate it, 
#' all within a single tibble

# For one continent
(.x <- nest_continent %>% pluck("data", 1))

lm(lifeExp ~ pop + gdpPercap + year, data = .x)

# Using `map()`
(nest_continent <-  nest_continent %>%
	mutate(fit = map(data,
		       ~ lm(lifeExp ~ pop + gdpPercap + year, data = .x))))

nest_continent %>% pluck("fit", 1)

#' Predict the response for the data stored in `data` column 
#' using the corresponding linear model

# For one continent
(.x <- nest_continent %>% pluck("fit", 1))

(newdata <- nest_continent %>% pluck("data", 1))

predict(.x, newdata = newdata) %>% head()

# Using `map()`
(nest_continent <- nest_continent %>%
	mutate(pred_lifeExp = map2(.x = fit,
			       .y = data,
			       .f = ~ predict(.x, newdata = .y))))

#' Calculate the correlation between predicted response and true response

# For 1 continent
.x <- nest_continent %>% pluck("pred_lifeExp", 1)
head(.x)

(.y <- nest_continent %>% pluck("data", 1))

cor(.x, .y$lifeExp)

# Using `map2()`
(nest_continent %>%
	mutate(cor_lifeExp = map2_dbl(.x = pred_lifeExp,
				.y = data,
				.f = ~ cor(.x, .y$lifeExp))))

#' ## Advanced exercise
#' Fit a separate linear model for each continent without splitting up the data. 
#' Create a data frame that has the continent, 
#' each term in the model for the continent, 
#' its linear model coefficient estimate, and standard error.
(gap <- gapminder %>%
	group_by(continent) %>%
	nest())

# For 1 continent
(.x <- gap %>% pluck("data", 1))

(fit <- lm(lifeExp ~ pop + gdpPercap + year, data = .x))

tidy(fit)

# Using `map`
gapminder %>%
	group_by(continent) %>%
	nest() %>%
	mutate(fit = map(data,
		       ~ lm(lifeExp ~ pop + gdpPercap + year, data = .x)),
	       fit_term = map(fit, tidy)) %>%
	select(continent, fit_term) %>%
	unnest(fit_term)

#' ## Additional purrr functionalities for lists
#' ### Create list of dataframes, keep 5 rows from each continent

(gap <- gapminder %>%
	group_split(continent) %>%
	map(~ sample_n(., 5)))

#' ### Keep/Discard: select_if for lists
#' #### `keep()`: only keeps elements of a list that satisfy a given condition

#' keeps dataframes in `gap` that have an average lifeExp of at least 70

gap %>% keep(~ mean(.x$lifeExp) >= 70)

#' #### `discard()`: discards any elements that satisfy given logical condition

gap %>% purrr::discard(~ mean(.x$lifeExp) >= 70)

#' ### Reduce
#' #### `reduce()`: combine (reduces) all of elements of a list into 
#' a single object by iteratively applying a binary function 
#' (a function that takes two inputs)

reduce(c(1, 2, 3), sum)

(s1 <- 1 + 2)
(s2 <- s1 + 3)

#' #### `accumulate()`: return intermediate values

accumulate(c(1, 2, 3), sum)

gap %>% reduce(rbind)

#' ### Logical statements for lists
#' `every()`  
#' e.g.: ask whether every continent has average lifeExp greater than 70

gap %>% every(~ mean(.x$lifeExp) > 70)

#' `some()`  
#' e.g.: ask whether some continents have average lifeExp greater than 70

gap %>% some(~ mean(.x$lifeExp) > 70)

#' `has_element()`: equivalent to `%in%`

list(1, c(2, 5, 1), "a") %>% has_element("a")


