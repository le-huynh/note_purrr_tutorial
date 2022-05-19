---
output:
    html_document:
      keep_md: TRUE
---


```r
library(tidyverse)
library(tidymodels)
library(gapminder)
```

## Dataset `gapminder`
Identify the type of each column


```r
gapminder %>% map_chr(class)
```

```
##   country continent      year   lifeExp       pop gdpPercap 
##  "factor"  "factor" "integer" "numeric" "integer" "numeric"
```

Identify the number of distinct values in each column


```r
gapminder %>% map_dbl(n_distinct)
```

```
##   country continent      year   lifeExp       pop gdpPercap 
##       142         5        12      1626      1704      1704
```

Form a dataframe: type of class, number of distinct values


```r
gapminder %>% map_df(~ (data.frame(class = class(.x),
			    n_distinct = n_distinct(.x))))
```

```
##     class n_distinct
## 1  factor        142
## 2  factor          5
## 3 integer         12
## 4 numeric       1626
## 5 integer       1704
## 6 numeric       1704
```

```r
gapminder %>% {
	tibble(class = map_chr(., class),
	       n_distinct = map_dbl(., n_distinct))
	}
```

```
## # A tibble: 6 x 2
##   class   n_distinct
##   <chr>        <dbl>
## 1 factor         142
## 2 factor           5
## 3 integer         12
## 4 numeric       1626
## 5 integer       1704
## 6 numeric       1704
```

Add variable names


```r
gapminder %>% map_df(~ (data.frame(class = class(.x),
			     n_distinct = n_distinct(.x))),
		 .id = "variable")
```

```
##    variable   class n_distinct
## 1   country  factor        142
## 2 continent  factor          5
## 3      year integer         12
## 4   lifeExp numeric       1626
## 5       pop integer       1704
## 6 gdpPercap numeric       1704
```

## Maps with multiple input objects
Create a *list of plots* that compare life expectancy and GDP per capita 
for each continent-year combination  
Example for 1 plot:


```r
gapminder %>%
	filter(continent == "Asia", year == 1952) %>%
	ggplot(aes(x = gdpPercap, y = lifeExp)) + 
	geom_point() +
	labs(title = "Asia 1952")
```

![](rebecca_barter_purrr_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```r
(continent <- gapminder %>% 
	distinct(continent, year) %>% 
	pull(continent) %>% 
	as.character())
```

```
##  [1] "Asia"     "Asia"     "Asia"     "Asia"     "Asia"     "Asia"    
##  [7] "Asia"     "Asia"     "Asia"     "Asia"     "Asia"     "Asia"    
## [13] "Europe"   "Europe"   "Europe"   "Europe"   "Europe"   "Europe"  
## [19] "Europe"   "Europe"   "Europe"   "Europe"   "Europe"   "Europe"  
## [25] "Africa"   "Africa"   "Africa"   "Africa"   "Africa"   "Africa"  
## [31] "Africa"   "Africa"   "Africa"   "Africa"   "Africa"   "Africa"  
## [37] "Americas" "Americas" "Americas" "Americas" "Americas" "Americas"
## [43] "Americas" "Americas" "Americas" "Americas" "Americas" "Americas"
## [49] "Oceania"  "Oceania"  "Oceania"  "Oceania"  "Oceania"  "Oceania" 
## [55] "Oceania"  "Oceania"  "Oceania"  "Oceania"  "Oceania"  "Oceania"
```

```r
(year <- gapminder %>% 
	distinct(continent, year) %>% 
	pull(year))
```

```
##  [1] 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 2002 2007 1952 1957 1962
## [16] 1967 1972 1977 1982 1987 1992 1997 2002 2007 1952 1957 1962 1967 1972 1977
## [31] 1982 1987 1992 1997 2002 2007 1952 1957 1962 1967 1972 1977 1982 1987 1992
## [46] 1997 2002 2007 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 2002 2007
```

```r
(.x <- continent[1])
```

```
## [1] "Asia"
```

```r
(.y <- year[1])
```

```
## [1] 1952
```

```r
gapminder %>%
	filter(continent == .x, year == .y) %>%
	ggplot(aes(x = gdpPercap, y = lifeExp)) + 
	geom_point() +
	labs(title = glue::glue(.x, " ", .y))
```

![](rebecca_barter_purrr_files/figure-html/unnamed-chunk-6-2.png)<!-- -->

Using `map2()`


```r
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
```

![](rebecca_barter_purrr_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
plot[[10]]
```

![](rebecca_barter_purrr_files/figure-html/unnamed-chunk-7-2.png)<!-- -->

## List columns and Nested data frames
### `dplyr::pluck()`: extract x-th entry from the data column


```r
(nest_continent <- gapminder %>%
		group_by(continent) %>%
		nest())
```

```
## # A tibble: 5 x 2
## # Groups:   continent [5]
##   continent data              
##   <fct>     <list>            
## 1 Asia      <tibble [396 x 5]>
## 2 Europe    <tibble [360 x 5]>
## 3 Africa    <tibble [624 x 5]>
## 4 Americas  <tibble [300 x 5]>
## 5 Oceania   <tibble [24 x 5]>
```

```r
nest_continent$data[[1]]
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

```r
nest_continent %>% pluck("data", 1)
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

Calculate the average life expectancy within each continent, 
add it as a new column


```r
gapminder %>%
	group_by(continent) %>%
	summarise(avg_lifeExp = mean(lifeExp))
```

```
## # A tibble: 5 x 2
##   continent avg_lifeExp
##   <fct>           <dbl>
## 1 Africa           48.9
## 2 Americas         64.7
## 3 Asia             60.1
## 4 Europe           71.9
## 5 Oceania          74.3
```

```r
# For one continent
(.x <- nest_continent %>% pluck("data", 1))
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

```r
mean(.x$lifeExp)
```

```
## [1] 60.0649
```

```r
# Using `map()`
(nest_continent %>%
	mutate(avg_lifeExp = map_dbl(data, ~ mean(.x$lifeExp))))
```

```
## # A tibble: 5 x 3
## # Groups:   continent [5]
##   continent data               avg_lifeExp
##   <fct>     <list>                   <dbl>
## 1 Asia      <tibble [396 x 5]>        60.1
## 2 Europe    <tibble [360 x 5]>        71.9
## 3 Africa    <tibble [624 x 5]>        48.9
## 4 Americas  <tibble [300 x 5]>        64.7
## 5 Oceania   <tibble [24 x 5]>         74.3
```

### fit a model separately for each continent, and evaluate it, 
all within a single tibble


```r
# For one continent
(.x <- nest_continent %>% pluck("data", 1))
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

```r
lm(lifeExp ~ pop + gdpPercap + year, data = .x)
```

```
## 
## Call:
## lm(formula = lifeExp ~ pop + gdpPercap + year, data = .x)
## 
## Coefficients:
## (Intercept)          pop    gdpPercap         year  
##  -7.833e+02    4.228e-11    2.510e-04    4.251e-01
```

```r
# Using `map()`
(nest_continent <-  nest_continent %>%
	mutate(fit = map(data,
		       ~ lm(lifeExp ~ pop + gdpPercap + year, data = .x))))
```

```
## # A tibble: 5 x 3
## # Groups:   continent [5]
##   continent data               fit   
##   <fct>     <list>             <list>
## 1 Asia      <tibble [396 x 5]> <lm>  
## 2 Europe    <tibble [360 x 5]> <lm>  
## 3 Africa    <tibble [624 x 5]> <lm>  
## 4 Americas  <tibble [300 x 5]> <lm>  
## 5 Oceania   <tibble [24 x 5]>  <lm>
```

```r
nest_continent %>% pluck("fit", 1)
```

```
## 
## Call:
## lm(formula = lifeExp ~ pop + gdpPercap + year, data = .x)
## 
## Coefficients:
## (Intercept)          pop    gdpPercap         year  
##  -7.833e+02    4.228e-11    2.510e-04    4.251e-01
```

Predict the response for the data stored in `data` column 
using the corresponding linear model


```r
# For one continent
(.x <- nest_continent %>% pluck("fit", 1))
```

```
## 
## Call:
## lm(formula = lifeExp ~ pop + gdpPercap + year, data = .x)
## 
## Coefficients:
## (Intercept)          pop    gdpPercap         year  
##  -7.833e+02    4.228e-11    2.510e-04    4.251e-01
```

```r
(newdata <- nest_continent %>% pluck("data", 1))
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

```r
predict(.x, newdata = newdata) %>% head()
```

```
##        1        2        3        4        5        6 
## 46.58480 48.72054 50.85400 52.97512 55.07635 57.21332
```

```r
# Using `map()`
(nest_continent <- nest_continent %>%
	mutate(pred_lifeExp = map2(.x = fit,
			       .y = data,
			       .f = ~ predict(.x, newdata = .y))))
```

```
## # A tibble: 5 x 4
## # Groups:   continent [5]
##   continent data               fit    pred_lifeExp
##   <fct>     <list>             <list> <list>      
## 1 Asia      <tibble [396 x 5]> <lm>   <dbl [396]> 
## 2 Europe    <tibble [360 x 5]> <lm>   <dbl [360]> 
## 3 Africa    <tibble [624 x 5]> <lm>   <dbl [624]> 
## 4 Americas  <tibble [300 x 5]> <lm>   <dbl [300]> 
## 5 Oceania   <tibble [24 x 5]>  <lm>   <dbl [24]>
```

Calculate the correlation between predicted response and true response


```r
# For 1 continent
.x <- nest_continent %>% pluck("pred_lifeExp", 1)
head(.x)
```

```
##        1        2        3        4        5        6 
## 46.58480 48.72054 50.85400 52.97512 55.07635 57.21332
```

```r
(.y <- nest_continent %>% pluck("data", 1))
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

```r
cor(.x, .y$lifeExp)
```

```
## [1] 0.7226439
```

```r
# Using `map2()`
(nest_continent %>%
	mutate(cor_lifeExp = map2_dbl(.x = pred_lifeExp,
				.y = data,
				.f = ~ cor(.x, .y$lifeExp))))
```

```
## # A tibble: 5 x 5
## # Groups:   continent [5]
##   continent data               fit    pred_lifeExp cor_lifeExp
##   <fct>     <list>             <list> <list>             <dbl>
## 1 Asia      <tibble [396 x 5]> <lm>   <dbl [396]>        0.723
## 2 Europe    <tibble [360 x 5]> <lm>   <dbl [360]>        0.834
## 3 Africa    <tibble [624 x 5]> <lm>   <dbl [624]>        0.645
## 4 Americas  <tibble [300 x 5]> <lm>   <dbl [300]>        0.779
## 5 Oceania   <tibble [24 x 5]>  <lm>   <dbl [24]>         0.987
```

## Advanced exercise
Fit a separate linear model for each continent without splitting up the data. 
Create a data frame that has the continent, 
each term in the model for the continent, 
its linear model coefficient estimate, and standard error.


```r
(gap <- gapminder %>%
	group_by(continent) %>%
	nest())
```

```
## # A tibble: 5 x 2
## # Groups:   continent [5]
##   continent data              
##   <fct>     <list>            
## 1 Asia      <tibble [396 x 5]>
## 2 Europe    <tibble [360 x 5]>
## 3 Africa    <tibble [624 x 5]>
## 4 Americas  <tibble [300 x 5]>
## 5 Oceania   <tibble [24 x 5]>
```

```r
# For 1 continent
(.x <- gap %>% pluck("data", 1))
```

```
## # A tibble: 396 x 5
##    country      year lifeExp      pop gdpPercap
##    <fct>       <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan  1952    28.8  8425333      779.
##  2 Afghanistan  1957    30.3  9240934      821.
##  3 Afghanistan  1962    32.0 10267083      853.
##  4 Afghanistan  1967    34.0 11537966      836.
##  5 Afghanistan  1972    36.1 13079460      740.
##  6 Afghanistan  1977    38.4 14880372      786.
##  7 Afghanistan  1982    39.9 12881816      978.
##  8 Afghanistan  1987    40.8 13867957      852.
##  9 Afghanistan  1992    41.7 16317921      649.
## 10 Afghanistan  1997    41.8 22227415      635.
## # ... with 386 more rows
```

```r
(fit <- lm(lifeExp ~ pop + gdpPercap + year, data = .x))
```

```
## 
## Call:
## lm(formula = lifeExp ~ pop + gdpPercap + year, data = .x)
## 
## Coefficients:
## (Intercept)          pop    gdpPercap         year  
##  -7.833e+02    4.228e-11    2.510e-04    4.251e-01
```

```r
tidy(fit)
```

```
## # A tibble: 4 x 5
##   term         estimate std.error statistic  p.value
##   <chr>           <dbl>     <dbl>     <dbl>    <dbl>
## 1 (Intercept) -7.83e+ 2   4.83e+1  -16.2    1.22e-45
## 2 pop          4.23e-11   2.04e-9    0.0207 9.83e- 1
## 3 gdpPercap    2.51e- 4   3.01e-5    8.34   1.31e-15
## 4 year         4.25e- 1   2.44e-2   17.4    1.13e-50
```

```r
# Using `map`
gapminder %>%
	group_by(continent) %>%
	nest() %>%
	mutate(fit = map(data,
		       ~ lm(lifeExp ~ pop + gdpPercap + year, data = .x)),
	       fit_term = map(fit, tidy)) %>%
	select(continent, fit_term) %>%
	unnest(fit_term)
```

```
## # A tibble: 20 x 6
## # Groups:   continent [5]
##    continent term         estimate std.error statistic  p.value
##    <fct>     <chr>           <dbl>     <dbl>     <dbl>    <dbl>
##  1 Asia      (Intercept) -7.83e+ 2   4.83e+1  -16.2    1.22e-45
##  2 Asia      pop          4.23e-11   2.04e-9    0.0207 9.83e- 1
##  3 Asia      gdpPercap    2.51e- 4   3.01e-5    8.34   1.31e-15
##  4 Asia      year         4.25e- 1   2.44e-2   17.4    1.13e-50
##  5 Europe    (Intercept) -1.61e+ 2   2.28e+1   -7.09   7.44e-12
##  6 Europe    pop         -8.18e- 9   7.80e-9   -1.05   2.95e- 1
##  7 Europe    gdpPercap    3.25e- 4   2.15e-5   15.2    2.21e-40
##  8 Europe    year         1.16e- 1   1.16e-2    9.96   8.88e-21
##  9 Africa    (Intercept) -4.70e+ 2   3.39e+1  -13.9    2.17e-38
## 10 Africa    pop         -3.68e- 9   1.89e-8   -0.195  8.45e- 1
## 11 Africa    gdpPercap    1.12e- 3   1.01e-4   11.1    2.46e-26
## 12 Africa    year         2.61e- 1   1.71e-2   15.2    1.07e-44
## 13 Americas  (Intercept) -5.33e+ 2   4.10e+1  -13.0    6.40e-31
## 14 Americas  pop         -2.15e- 8   8.62e-9   -2.49   1.32e- 2
## 15 Americas  gdpPercap    6.75e- 4   7.15e-5    9.44   1.13e-18
## 16 Americas  year         3.00e- 1   2.08e-2   14.4    3.79e-36
## 17 Oceania   (Intercept) -2.10e+ 2   5.12e+1   -4.10   5.61e- 4
## 18 Oceania   pop          8.37e- 9   3.34e-8    0.251  8.05e- 1
## 19 Oceania   gdpPercap    2.03e- 4   8.47e-5    2.39   2.66e- 2
## 20 Oceania   year         1.42e- 1   2.65e-2    5.34   3.19e- 5
```

## Additional purrr functionalities for lists
### Create list of dataframes, keep 5 rows from each continent


```r
(gap <- gapminder %>%
	group_split(continent) %>%
	map(~ sample_n(., 5)))
```

```
## [[1]]
## # A tibble: 5 x 6
##   country      continent  year lifeExp      pop gdpPercap
##   <fct>        <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Namibia      Africa     2002    51.5  1972153     4072.
## 2 Guinea       Africa     1967    37.2  3451418      709.
## 3 South Africa Africa     1962    50.0 18356657     5769.
## 4 Chad         Africa     1997    51.6  7562011     1005.
## 5 Morocco      Africa     1962    47.9 13056604     1566.
## 
## [[2]]
## # A tibble: 5 x 6
##   country             continent  year lifeExp      pop gdpPercap
##   <fct>               <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Peru                Americas   1997    68.4 24748122     5838.
## 2 Trinidad and Tobago Americas   1962    64.9   887498     4998.
## 3 Cuba                Americas   1982    73.7  9789224     7317.
## 4 Guatemala           Americas   1972    53.7  5149581     4031.
## 5 Mexico              Americas   1977    65.0 63759976     7675.
## 
## [[3]]
## # A tibble: 5 x 6
##   country     continent  year lifeExp       pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>     <int>     <dbl>
## 1 Myanmar     Asia       1997    60.3  43247867      415 
## 2 Japan       Asia       1992    79.4 124329269    26825.
## 3 Israel      Asia       1987    75.6   4203148    17122.
## 4 Korea, Rep. Asia       1987    69.8  41622000     8533.
## 5 China       Asia       1972    63.1 862030000      677.
## 
## [[4]]
## # A tibble: 5 x 6
##   country  continent  year lifeExp      pop gdpPercap
##   <fct>    <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Italy    Europe     1957    67.8 49182000     6249.
## 2 Serbia   Europe     1962    64.5  7616060     6290.
## 3 Portugal Europe     1997    76.0 10156415    17641.
## 4 Norway   Europe     1992    77.3  4286357    33966.
## 5 Slovenia Europe     2007    77.9  2009245    25768.
## 
## [[5]]
## # A tibble: 5 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Australia   Oceania    1957    70.3  9712569    10950.
## 2 Australia   Oceania    1982    74.7 15184200    19477.
## 3 New Zealand Oceania    1987    74.3  3317166    19007.
## 4 New Zealand Oceania    1997    77.6  3676187    21050.
## 5 New Zealand Oceania    2007    80.2  4115771    25185.
```

### Keep/Discard: select_if for lists
#### `keep()`: only keeps elements of a list that satisfy a given condition
keeps dataframes in `gap` that have an average lifeExp of at least 70


```r
gap %>% keep(~ mean(.x$lifeExp) >= 70)
```

```
## [[1]]
## # A tibble: 5 x 6
##   country  continent  year lifeExp      pop gdpPercap
##   <fct>    <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Italy    Europe     1957    67.8 49182000     6249.
## 2 Serbia   Europe     1962    64.5  7616060     6290.
## 3 Portugal Europe     1997    76.0 10156415    17641.
## 4 Norway   Europe     1992    77.3  4286357    33966.
## 5 Slovenia Europe     2007    77.9  2009245    25768.
## 
## [[2]]
## # A tibble: 5 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Australia   Oceania    1957    70.3  9712569    10950.
## 2 Australia   Oceania    1982    74.7 15184200    19477.
## 3 New Zealand Oceania    1987    74.3  3317166    19007.
## 4 New Zealand Oceania    1997    77.6  3676187    21050.
## 5 New Zealand Oceania    2007    80.2  4115771    25185.
```

#### `discard()`: discards any elements that satisfy given logical condition


```r
gap %>% purrr::discard(~ mean(.x$lifeExp) >= 70)
```

```
## [[1]]
## # A tibble: 5 x 6
##   country      continent  year lifeExp      pop gdpPercap
##   <fct>        <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Namibia      Africa     2002    51.5  1972153     4072.
## 2 Guinea       Africa     1967    37.2  3451418      709.
## 3 South Africa Africa     1962    50.0 18356657     5769.
## 4 Chad         Africa     1997    51.6  7562011     1005.
## 5 Morocco      Africa     1962    47.9 13056604     1566.
## 
## [[2]]
## # A tibble: 5 x 6
##   country             continent  year lifeExp      pop gdpPercap
##   <fct>               <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Peru                Americas   1997    68.4 24748122     5838.
## 2 Trinidad and Tobago Americas   1962    64.9   887498     4998.
## 3 Cuba                Americas   1982    73.7  9789224     7317.
## 4 Guatemala           Americas   1972    53.7  5149581     4031.
## 5 Mexico              Americas   1977    65.0 63759976     7675.
## 
## [[3]]
## # A tibble: 5 x 6
##   country     continent  year lifeExp       pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>     <int>     <dbl>
## 1 Myanmar     Asia       1997    60.3  43247867      415 
## 2 Japan       Asia       1992    79.4 124329269    26825.
## 3 Israel      Asia       1987    75.6   4203148    17122.
## 4 Korea, Rep. Asia       1987    69.8  41622000     8533.
## 5 China       Asia       1972    63.1 862030000      677.
```

### Reduce
#### `reduce()`: combine (reduces) all of elements of a list into 
a single object by iteratively applying a binary function 
(a function that takes two inputs)


```r
reduce(c(1, 2, 3), sum)
```

```
## [1] 6
```

```r
(s1 <- 1 + 2)
```

```
## [1] 3
```

```r
(s2 <- s1 + 3)
```

```
## [1] 6
```

#### `accumulate()`: return intermediate values


```r
accumulate(c(1, 2, 3), sum)
```

```
## [1] 1 3 6
```

```r
gap %>% reduce(rbind)
```

```
## # A tibble: 25 x 6
##    country             continent  year lifeExp      pop gdpPercap
##    <fct>               <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Namibia             Africa     2002    51.5  1972153     4072.
##  2 Guinea              Africa     1967    37.2  3451418      709.
##  3 South Africa        Africa     1962    50.0 18356657     5769.
##  4 Chad                Africa     1997    51.6  7562011     1005.
##  5 Morocco             Africa     1962    47.9 13056604     1566.
##  6 Peru                Americas   1997    68.4 24748122     5838.
##  7 Trinidad and Tobago Americas   1962    64.9   887498     4998.
##  8 Cuba                Americas   1982    73.7  9789224     7317.
##  9 Guatemala           Americas   1972    53.7  5149581     4031.
## 10 Mexico              Americas   1977    65.0 63759976     7675.
## # ... with 15 more rows
```

### Logical statements for lists
`every()`  
e.g.: ask whether every continent has average lifeExp greater than 70


```r
gap %>% every(~ mean(.x$lifeExp) > 70)
```

```
## [1] FALSE
```

`some()`  
e.g.: ask whether some continents have average lifeExp greater than 70


```r
gap %>% some(~ mean(.x$lifeExp) > 70)
```

```
## [1] TRUE
```

`has_element()`: equivalent to `%in%`


```r
list(1, c(2, 5, 1), "a") %>% has_element("a")
```

```
## [1] TRUE
```



---
title: rebecca_barter_purrr.R
author: LY
date: '2022-05-19'

---
