---
output:
    html_document:
      keep_md: TRUE
---


```r
library(tidyverse)
library(gapminder)
```

Subset of `gapminder` dataset:  
- Contain data of Germany and Canada  
- Calculate mean of life expectancy  


```r
gapminder %>%
	filter(country %in% c("Germany", "Canada")) %>%
	group_by(country) %>%
	summarise(mean_lifeExp = mean(lifeExp))
```

```
## # A tibble: 2 x 2
##   country mean_lifeExp
##   <fct>          <dbl>
## 1 Canada          74.9
## 2 Germany         73.4
```

Mean of life expectancy and of GDP per capita


```r
gapminder %>%
	filter(country %in% c("Germany", "Canada")) %>%
	group_by(country) %>%
	summarise(across(c(lifeExp, gdpPercap), mean))
```

```
## # A tibble: 2 x 3
##   country lifeExp gdpPercap
##   <fct>     <dbl>     <dbl>
## 1 Canada     74.9    22411.
## 2 Germany    73.4    20557.
```

```r
gapminder %>%
	filter(country %in% c("Germany", "Canada")) %>%
	group_by(country) %>%
	summarise_at(vars(lifeExp, gdpPercap), mean)
```

```
## # A tibble: 2 x 3
##   country lifeExp gdpPercap
##   <fct>     <dbl>     <dbl>
## 1 Canada     74.9    22411.
## 2 Germany    73.4    20557.
```

Correlation of life expectancy and year for full dataset


```r
gapminder %>%
	group_by(country) %>%
	summarise(cor = cor(lifeExp, year))
```

```
## # A tibble: 142 x 2
##    country       cor
##    <fct>       <dbl>
##  1 Afghanistan 0.974
##  2 Albania     0.954
##  3 Algeria     0.993
##  4 Angola      0.942
##  5 Argentina   0.998
##  6 Australia   0.990
##  7 Austria     0.996
##  8 Bahrain     0.983
##  9 Bangladesh  0.995
## 10 Belgium     0.997
## # ... with 132 more rows
```

Fit a linear model of life expectancy against year


```r
(fit_res <- gapminder %>%
	group_by(country, continent) %>%
	nest() %>%
	mutate(fit = map(data, ~ lm(lifeExp ~ year, data = .))))
```

```
## # A tibble: 142 x 4
## # Groups:   country, continent [142]
##    country     continent data              fit   
##    <fct>       <fct>     <list>            <list>
##  1 Afghanistan Asia      <tibble [12 x 4]> <lm>  
##  2 Albania     Europe    <tibble [12 x 4]> <lm>  
##  3 Algeria     Africa    <tibble [12 x 4]> <lm>  
##  4 Angola      Africa    <tibble [12 x 4]> <lm>  
##  5 Argentina   Americas  <tibble [12 x 4]> <lm>  
##  6 Australia   Oceania   <tibble [12 x 4]> <lm>  
##  7 Austria     Europe    <tibble [12 x 4]> <lm>  
##  8 Bahrain     Asia      <tibble [12 x 4]> <lm>  
##  9 Bangladesh  Asia      <tibble [12 x 4]> <lm>  
## 10 Belgium     Europe    <tibble [12 x 4]> <lm>  
## # ... with 132 more rows
```

```r
fit_res$fit[1]
```

```
## [[1]]
## 
## Call:
## lm(formula = lifeExp ~ year, data = .)
## 
## Coefficients:
## (Intercept)         year  
##   -507.5343       0.2753
```

Inspect the fits for Oceania


```r
fit_res %>%
	filter(continent == "Oceania") %>%
	.$fit
```

```
## [[1]]
## 
## Call:
## lm(formula = lifeExp ~ year, data = .)
## 
## Coefficients:
## (Intercept)         year  
##   -376.1163       0.2277  
## 
## 
## [[2]]
## 
## Call:
## lm(formula = lifeExp ~ year, data = .)
## 
## Coefficients:
## (Intercept)         year  
##   -307.6996       0.1928
```

Form a data frame with one row per country and 
variables for country, continent, estimated intercept, and estimated slope


```r
fit_res %>%
	mutate(coef = map(fit, coef),
	       intercept = map_dbl(coef, 1),
	       slope = map_dbl(coef, 2)) %>%
	select(country, continent, intercept, slope)
```

```
## # A tibble: 142 x 4
## # Groups:   country, continent [142]
##    country     continent intercept slope
##    <fct>       <fct>         <dbl> <dbl>
##  1 Afghanistan Asia          -508. 0.275
##  2 Albania     Europe        -594. 0.335
##  3 Algeria     Africa       -1068. 0.569
##  4 Angola      Africa        -377. 0.209
##  5 Argentina   Americas      -390. 0.232
##  6 Australia   Oceania       -376. 0.228
##  7 Austria     Europe        -406. 0.242
##  8 Bahrain     Asia          -860. 0.468
##  9 Bangladesh  Asia          -936. 0.498
## 10 Belgium     Europe        -340. 0.209
## # ... with 132 more rows
```



---
title: lesson02_basic.R
author: LY
date: '2022-05-19'

---
