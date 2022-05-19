#'---
#' output:
#'     html_document:
#'       keep_md: TRUE
#'---

#+ message=FALSE
library(tidyverse)
library(gapminder)

#' Subset of `gapminder` dataset:  
#' - Contain data of Germany and Canada  
#' - Calculate mean of life expectancy  
gapminder %>%
	filter(country %in% c("Germany", "Canada")) %>%
	group_by(country) %>%
	summarise(mean_lifeExp = mean(lifeExp))

#' Mean of life expectancy and of GDP per capita
gapminder %>%
	filter(country %in% c("Germany", "Canada")) %>%
	group_by(country) %>%
	summarise(across(c(lifeExp, gdpPercap), mean))

gapminder %>%
	filter(country %in% c("Germany", "Canada")) %>%
	group_by(country) %>%
	summarise_at(vars(lifeExp, gdpPercap), mean)

#' Correlation of life expectancy and year for full dataset
gapminder %>%
	group_by(country) %>%
	summarise(cor = cor(lifeExp, year))

#' Fit a linear model of life expectancy against year
(fit_res <- gapminder %>%
	group_by(country, continent) %>%
	nest() %>%
	mutate(fit = map(data, ~ lm(lifeExp ~ year, data = .))))

fit_res$fit[1]

#' Inspect the fits for Oceania
fit_res %>%
	filter(continent == "Oceania") %>%
	.$fit

#' Form a data frame with one row per country and 
#' variables for country, continent, estimated intercept, and estimated slope
fit_res %>%
	mutate(coef = map(fit, coef),
	       intercept = map_dbl(coef, 1),
	       slope = map_dbl(coef, 2)) %>%
	select(country, continent, intercept, slope)

