---
output:
    html_document:
      keep_md: TRUE
---


```r
library(tidyverse)
library(repurrrsive)
```

### Name and position shortcuts


```r
names(got_chars[[1]])
```

```
##  [1] "url"         "id"          "name"        "gender"      "culture"    
##  [6] "born"        "died"        "alive"       "titles"      "aliases"    
## [11] "father"      "mother"      "spouse"      "allegiances" "books"      
## [16] "povBooks"    "tvSeries"    "playedBy"
```

```r
got_chars %>% map("name")
```

```
## [[1]]
## [1] "Theon Greyjoy"
## 
## [[2]]
## [1] "Tyrion Lannister"
## 
## [[3]]
## [1] "Victarion Greyjoy"
## 
## [[4]]
## [1] "Will"
## 
## [[5]]
## [1] "Areo Hotah"
## 
## [[6]]
## [1] "Chett"
## 
## [[7]]
## [1] "Cressen"
## 
## [[8]]
## [1] "Arianne Martell"
## 
## [[9]]
## [1] "Daenerys Targaryen"
## 
## [[10]]
## [1] "Davos Seaworth"
## 
## [[11]]
## [1] "Arya Stark"
## 
## [[12]]
## [1] "Arys Oakheart"
## 
## [[13]]
## [1] "Asha Greyjoy"
## 
## [[14]]
## [1] "Barristan Selmy"
## 
## [[15]]
## [1] "Varamyr"
## 
## [[16]]
## [1] "Brandon Stark"
## 
## [[17]]
## [1] "Brienne of Tarth"
## 
## [[18]]
## [1] "Catelyn Stark"
## 
## [[19]]
## [1] "Cersei Lannister"
## 
## [[20]]
## [1] "Eddard Stark"
## 
## [[21]]
## [1] "Jaime Lannister"
## 
## [[22]]
## [1] "Jon Connington"
## 
## [[23]]
## [1] "Jon Snow"
## 
## [[24]]
## [1] "Aeron Greyjoy"
## 
## [[25]]
## [1] "Kevan Lannister"
## 
## [[26]]
## [1] "Melisandre"
## 
## [[27]]
## [1] "Merrett Frey"
## 
## [[28]]
## [1] "Quentyn Martell"
## 
## [[29]]
## [1] "Samwell Tarly"
## 
## [[30]]
## [1] "Sansa Stark"
```

```r
got_chars %>% map(3)
```

```
## [[1]]
## [1] "Theon Greyjoy"
## 
## [[2]]
## [1] "Tyrion Lannister"
## 
## [[3]]
## [1] "Victarion Greyjoy"
## 
## [[4]]
## [1] "Will"
## 
## [[5]]
## [1] "Areo Hotah"
## 
## [[6]]
## [1] "Chett"
## 
## [[7]]
## [1] "Cressen"
## 
## [[8]]
## [1] "Arianne Martell"
## 
## [[9]]
## [1] "Daenerys Targaryen"
## 
## [[10]]
## [1] "Davos Seaworth"
## 
## [[11]]
## [1] "Arya Stark"
## 
## [[12]]
## [1] "Arys Oakheart"
## 
## [[13]]
## [1] "Asha Greyjoy"
## 
## [[14]]
## [1] "Barristan Selmy"
## 
## [[15]]
## [1] "Varamyr"
## 
## [[16]]
## [1] "Brandon Stark"
## 
## [[17]]
## [1] "Brienne of Tarth"
## 
## [[18]]
## [1] "Catelyn Stark"
## 
## [[19]]
## [1] "Cersei Lannister"
## 
## [[20]]
## [1] "Eddard Stark"
## 
## [[21]]
## [1] "Jaime Lannister"
## 
## [[22]]
## [1] "Jon Connington"
## 
## [[23]]
## [1] "Jon Snow"
## 
## [[24]]
## [1] "Aeron Greyjoy"
## 
## [[25]]
## [1] "Kevan Lannister"
## 
## [[26]]
## [1] "Melisandre"
## 
## [[27]]
## [1] "Merrett Frey"
## 
## [[28]]
## [1] "Quentyn Martell"
## 
## [[29]]
## [1] "Samwell Tarly"
## 
## [[30]]
## [1] "Sansa Stark"
```

### Type-specific map  
Use a type-specific form of map() and an extraction shortcut to 
extract these ids into an integer vector


```r
got_chars %>% map_int("id")
```

```
##  [1] 1022 1052 1074 1109 1166 1267 1295  130 1303 1319  148  149  150  168 2066
## [16]  208  216  232  238  339  529  576  583   60  605  743  751  844  954  957
```

```r
got_chars %>% map("id")
```

```
## [[1]]
## [1] 1022
## 
## [[2]]
## [1] 1052
## 
## [[3]]
## [1] 1074
## 
## [[4]]
## [1] 1109
## 
## [[5]]
## [1] 1166
## 
## [[6]]
## [1] 1267
## 
## [[7]]
## [1] 1295
## 
## [[8]]
## [1] 130
## 
## [[9]]
## [1] 1303
## 
## [[10]]
## [1] 1319
## 
## [[11]]
## [1] 148
## 
## [[12]]
## [1] 149
## 
## [[13]]
## [1] 150
## 
## [[14]]
## [1] 168
## 
## [[15]]
## [1] 2066
## 
## [[16]]
## [1] 208
## 
## [[17]]
## [1] 216
## 
## [[18]]
## [1] 232
## 
## [[19]]
## [1] 238
## 
## [[20]]
## [1] 339
## 
## [[21]]
## [1] 529
## 
## [[22]]
## [1] 576
## 
## [[23]]
## [1] 583
## 
## [[24]]
## [1] 60
## 
## [[25]]
## [1] 605
## 
## [[26]]
## [1] 743
## 
## [[27]]
## [1] 751
## 
## [[28]]
## [1] 844
## 
## [[29]]
## [1] 954
## 
## [[30]]
## [1] 957
```

Use your list inspection strategies to find the list element that is logical


```r
got_chars[[1]] %>% map(is.logical)
```

```
## $url
## [1] FALSE
## 
## $id
## [1] FALSE
## 
## $name
## [1] FALSE
## 
## $gender
## [1] FALSE
## 
## $culture
## [1] FALSE
## 
## $born
## [1] FALSE
## 
## $died
## [1] FALSE
## 
## $alive
## [1] TRUE
## 
## $titles
## [1] FALSE
## 
## $aliases
## [1] FALSE
## 
## $father
## [1] FALSE
## 
## $mother
## [1] FALSE
## 
## $spouse
## [1] FALSE
## 
## $allegiances
## [1] FALSE
## 
## $books
## [1] FALSE
## 
## $povBooks
## [1] FALSE
## 
## $tvSeries
## [1] FALSE
## 
## $playedBy
## [1] FALSE
```

Use a type-specific form of map() and an extraction shortcut to 
extract these values for all characters into a logical vector


```r
got_chars %>% map_lgl("alive")
```

```
##  [1]  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
## [13]  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
## [25] FALSE  TRUE FALSE FALSE  TRUE  TRUE
```

### Extract multiple values


```r
got_chars %>% map(`[`, c("name", "gender", "born"))
```

```
## [[1]]
## [[1]]$name
## [1] "Theon Greyjoy"
## 
## [[1]]$gender
## [1] "Male"
## 
## [[1]]$born
## [1] "In 278 AC or 279 AC, at Pyke"
## 
## 
## [[2]]
## [[2]]$name
## [1] "Tyrion Lannister"
## 
## [[2]]$gender
## [1] "Male"
## 
## [[2]]$born
## [1] "In 273 AC, at Casterly Rock"
## 
## 
## [[3]]
## [[3]]$name
## [1] "Victarion Greyjoy"
## 
## [[3]]$gender
## [1] "Male"
## 
## [[3]]$born
## [1] "In 268 AC or before, at Pyke"
## 
## 
## [[4]]
## [[4]]$name
## [1] "Will"
## 
## [[4]]$gender
## [1] "Male"
## 
## [[4]]$born
## [1] ""
## 
## 
## [[5]]
## [[5]]$name
## [1] "Areo Hotah"
## 
## [[5]]$gender
## [1] "Male"
## 
## [[5]]$born
## [1] "In 257 AC or before, at Norvos"
## 
## 
## [[6]]
## [[6]]$name
## [1] "Chett"
## 
## [[6]]$gender
## [1] "Male"
## 
## [[6]]$born
## [1] "At Hag's Mire"
## 
## 
## [[7]]
## [[7]]$name
## [1] "Cressen"
## 
## [[7]]$gender
## [1] "Male"
## 
## [[7]]$born
## [1] "In 219 AC or 220 AC"
## 
## 
## [[8]]
## [[8]]$name
## [1] "Arianne Martell"
## 
## [[8]]$gender
## [1] "Female"
## 
## [[8]]$born
## [1] "In 276 AC, at Sunspear"
## 
## 
## [[9]]
## [[9]]$name
## [1] "Daenerys Targaryen"
## 
## [[9]]$gender
## [1] "Female"
## 
## [[9]]$born
## [1] "In 284 AC, at Dragonstone"
## 
## 
## [[10]]
## [[10]]$name
## [1] "Davos Seaworth"
## 
## [[10]]$gender
## [1] "Male"
## 
## [[10]]$born
## [1] "In 260 AC or before, at King's Landing"
## 
## 
## [[11]]
## [[11]]$name
## [1] "Arya Stark"
## 
## [[11]]$gender
## [1] "Female"
## 
## [[11]]$born
## [1] "In 289 AC, at Winterfell"
## 
## 
## [[12]]
## [[12]]$name
## [1] "Arys Oakheart"
## 
## [[12]]$gender
## [1] "Male"
## 
## [[12]]$born
## [1] "At Old Oak"
## 
## 
## [[13]]
## [[13]]$name
## [1] "Asha Greyjoy"
## 
## [[13]]$gender
## [1] "Female"
## 
## [[13]]$born
## [1] "In 275 AC or 276 AC, at Pyke"
## 
## 
## [[14]]
## [[14]]$name
## [1] "Barristan Selmy"
## 
## [[14]]$gender
## [1] "Male"
## 
## [[14]]$born
## [1] "In 237 AC"
## 
## 
## [[15]]
## [[15]]$name
## [1] "Varamyr"
## 
## [[15]]$gender
## [1] "Male"
## 
## [[15]]$born
## [1] "At a village Beyond the Wall"
## 
## 
## [[16]]
## [[16]]$name
## [1] "Brandon Stark"
## 
## [[16]]$gender
## [1] "Male"
## 
## [[16]]$born
## [1] "In 290 AC, at Winterfell"
## 
## 
## [[17]]
## [[17]]$name
## [1] "Brienne of Tarth"
## 
## [[17]]$gender
## [1] "Female"
## 
## [[17]]$born
## [1] "In 280 AC"
## 
## 
## [[18]]
## [[18]]$name
## [1] "Catelyn Stark"
## 
## [[18]]$gender
## [1] "Female"
## 
## [[18]]$born
## [1] "In 264 AC, at Riverrun"
## 
## 
## [[19]]
## [[19]]$name
## [1] "Cersei Lannister"
## 
## [[19]]$gender
## [1] "Female"
## 
## [[19]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[20]]
## [[20]]$name
## [1] "Eddard Stark"
## 
## [[20]]$gender
## [1] "Male"
## 
## [[20]]$born
## [1] "In 263 AC, at Winterfell"
## 
## 
## [[21]]
## [[21]]$name
## [1] "Jaime Lannister"
## 
## [[21]]$gender
## [1] "Male"
## 
## [[21]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[22]]
## [[22]]$name
## [1] "Jon Connington"
## 
## [[22]]$gender
## [1] "Male"
## 
## [[22]]$born
## [1] "In or between 263 AC and 265 AC"
## 
## 
## [[23]]
## [[23]]$name
## [1] "Jon Snow"
## 
## [[23]]$gender
## [1] "Male"
## 
## [[23]]$born
## [1] "In 283 AC"
## 
## 
## [[24]]
## [[24]]$name
## [1] "Aeron Greyjoy"
## 
## [[24]]$gender
## [1] "Male"
## 
## [[24]]$born
## [1] "In or between 269 AC and 273 AC, at Pyke"
## 
## 
## [[25]]
## [[25]]$name
## [1] "Kevan Lannister"
## 
## [[25]]$gender
## [1] "Male"
## 
## [[25]]$born
## [1] "In 244 AC"
## 
## 
## [[26]]
## [[26]]$name
## [1] "Melisandre"
## 
## [[26]]$gender
## [1] "Female"
## 
## [[26]]$born
## [1] "At Unknown"
## 
## 
## [[27]]
## [[27]]$name
## [1] "Merrett Frey"
## 
## [[27]]$gender
## [1] "Male"
## 
## [[27]]$born
## [1] "In 262 AC"
## 
## 
## [[28]]
## [[28]]$name
## [1] "Quentyn Martell"
## 
## [[28]]$gender
## [1] "Male"
## 
## [[28]]$born
## [1] "In 281 AC, at Sunspear, Dorne"
## 
## 
## [[29]]
## [[29]]$name
## [1] "Samwell Tarly"
## 
## [[29]]$gender
## [1] "Male"
## 
## [[29]]$born
## [1] "In 283 AC, at Horn Hill"
## 
## 
## [[30]]
## [[30]]$name
## [1] "Sansa Stark"
## 
## [[30]]$gender
## [1] "Female"
## 
## [[30]]$born
## [1] "In 286 AC, at Winterfell"
```

```r
got_chars %>% map(`[`, c(3, 4, 6))
```

```
## [[1]]
## [[1]]$name
## [1] "Theon Greyjoy"
## 
## [[1]]$gender
## [1] "Male"
## 
## [[1]]$born
## [1] "In 278 AC or 279 AC, at Pyke"
## 
## 
## [[2]]
## [[2]]$name
## [1] "Tyrion Lannister"
## 
## [[2]]$gender
## [1] "Male"
## 
## [[2]]$born
## [1] "In 273 AC, at Casterly Rock"
## 
## 
## [[3]]
## [[3]]$name
## [1] "Victarion Greyjoy"
## 
## [[3]]$gender
## [1] "Male"
## 
## [[3]]$born
## [1] "In 268 AC or before, at Pyke"
## 
## 
## [[4]]
## [[4]]$name
## [1] "Will"
## 
## [[4]]$gender
## [1] "Male"
## 
## [[4]]$born
## [1] ""
## 
## 
## [[5]]
## [[5]]$name
## [1] "Areo Hotah"
## 
## [[5]]$gender
## [1] "Male"
## 
## [[5]]$born
## [1] "In 257 AC or before, at Norvos"
## 
## 
## [[6]]
## [[6]]$name
## [1] "Chett"
## 
## [[6]]$gender
## [1] "Male"
## 
## [[6]]$born
## [1] "At Hag's Mire"
## 
## 
## [[7]]
## [[7]]$name
## [1] "Cressen"
## 
## [[7]]$gender
## [1] "Male"
## 
## [[7]]$born
## [1] "In 219 AC or 220 AC"
## 
## 
## [[8]]
## [[8]]$name
## [1] "Arianne Martell"
## 
## [[8]]$gender
## [1] "Female"
## 
## [[8]]$born
## [1] "In 276 AC, at Sunspear"
## 
## 
## [[9]]
## [[9]]$name
## [1] "Daenerys Targaryen"
## 
## [[9]]$gender
## [1] "Female"
## 
## [[9]]$born
## [1] "In 284 AC, at Dragonstone"
## 
## 
## [[10]]
## [[10]]$name
## [1] "Davos Seaworth"
## 
## [[10]]$gender
## [1] "Male"
## 
## [[10]]$born
## [1] "In 260 AC or before, at King's Landing"
## 
## 
## [[11]]
## [[11]]$name
## [1] "Arya Stark"
## 
## [[11]]$gender
## [1] "Female"
## 
## [[11]]$born
## [1] "In 289 AC, at Winterfell"
## 
## 
## [[12]]
## [[12]]$name
## [1] "Arys Oakheart"
## 
## [[12]]$gender
## [1] "Male"
## 
## [[12]]$born
## [1] "At Old Oak"
## 
## 
## [[13]]
## [[13]]$name
## [1] "Asha Greyjoy"
## 
## [[13]]$gender
## [1] "Female"
## 
## [[13]]$born
## [1] "In 275 AC or 276 AC, at Pyke"
## 
## 
## [[14]]
## [[14]]$name
## [1] "Barristan Selmy"
## 
## [[14]]$gender
## [1] "Male"
## 
## [[14]]$born
## [1] "In 237 AC"
## 
## 
## [[15]]
## [[15]]$name
## [1] "Varamyr"
## 
## [[15]]$gender
## [1] "Male"
## 
## [[15]]$born
## [1] "At a village Beyond the Wall"
## 
## 
## [[16]]
## [[16]]$name
## [1] "Brandon Stark"
## 
## [[16]]$gender
## [1] "Male"
## 
## [[16]]$born
## [1] "In 290 AC, at Winterfell"
## 
## 
## [[17]]
## [[17]]$name
## [1] "Brienne of Tarth"
## 
## [[17]]$gender
## [1] "Female"
## 
## [[17]]$born
## [1] "In 280 AC"
## 
## 
## [[18]]
## [[18]]$name
## [1] "Catelyn Stark"
## 
## [[18]]$gender
## [1] "Female"
## 
## [[18]]$born
## [1] "In 264 AC, at Riverrun"
## 
## 
## [[19]]
## [[19]]$name
## [1] "Cersei Lannister"
## 
## [[19]]$gender
## [1] "Female"
## 
## [[19]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[20]]
## [[20]]$name
## [1] "Eddard Stark"
## 
## [[20]]$gender
## [1] "Male"
## 
## [[20]]$born
## [1] "In 263 AC, at Winterfell"
## 
## 
## [[21]]
## [[21]]$name
## [1] "Jaime Lannister"
## 
## [[21]]$gender
## [1] "Male"
## 
## [[21]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[22]]
## [[22]]$name
## [1] "Jon Connington"
## 
## [[22]]$gender
## [1] "Male"
## 
## [[22]]$born
## [1] "In or between 263 AC and 265 AC"
## 
## 
## [[23]]
## [[23]]$name
## [1] "Jon Snow"
## 
## [[23]]$gender
## [1] "Male"
## 
## [[23]]$born
## [1] "In 283 AC"
## 
## 
## [[24]]
## [[24]]$name
## [1] "Aeron Greyjoy"
## 
## [[24]]$gender
## [1] "Male"
## 
## [[24]]$born
## [1] "In or between 269 AC and 273 AC, at Pyke"
## 
## 
## [[25]]
## [[25]]$name
## [1] "Kevan Lannister"
## 
## [[25]]$gender
## [1] "Male"
## 
## [[25]]$born
## [1] "In 244 AC"
## 
## 
## [[26]]
## [[26]]$name
## [1] "Melisandre"
## 
## [[26]]$gender
## [1] "Female"
## 
## [[26]]$born
## [1] "At Unknown"
## 
## 
## [[27]]
## [[27]]$name
## [1] "Merrett Frey"
## 
## [[27]]$gender
## [1] "Male"
## 
## [[27]]$born
## [1] "In 262 AC"
## 
## 
## [[28]]
## [[28]]$name
## [1] "Quentyn Martell"
## 
## [[28]]$gender
## [1] "Male"
## 
## [[28]]$born
## [1] "In 281 AC, at Sunspear, Dorne"
## 
## 
## [[29]]
## [[29]]$name
## [1] "Samwell Tarly"
## 
## [[29]]$gender
## [1] "Male"
## 
## [[29]]$born
## [1] "In 283 AC, at Horn Hill"
## 
## 
## [[30]]
## [[30]]$name
## [1] "Sansa Stark"
## 
## [[30]]$gender
## [1] "Female"
## 
## [[30]]$born
## [1] "In 286 AC, at Winterfell"
```

```r
got_chars %>% map(magrittr::extract, c("name", "gender", "born"))
```

```
## [[1]]
## [[1]]$name
## [1] "Theon Greyjoy"
## 
## [[1]]$gender
## [1] "Male"
## 
## [[1]]$born
## [1] "In 278 AC or 279 AC, at Pyke"
## 
## 
## [[2]]
## [[2]]$name
## [1] "Tyrion Lannister"
## 
## [[2]]$gender
## [1] "Male"
## 
## [[2]]$born
## [1] "In 273 AC, at Casterly Rock"
## 
## 
## [[3]]
## [[3]]$name
## [1] "Victarion Greyjoy"
## 
## [[3]]$gender
## [1] "Male"
## 
## [[3]]$born
## [1] "In 268 AC or before, at Pyke"
## 
## 
## [[4]]
## [[4]]$name
## [1] "Will"
## 
## [[4]]$gender
## [1] "Male"
## 
## [[4]]$born
## [1] ""
## 
## 
## [[5]]
## [[5]]$name
## [1] "Areo Hotah"
## 
## [[5]]$gender
## [1] "Male"
## 
## [[5]]$born
## [1] "In 257 AC or before, at Norvos"
## 
## 
## [[6]]
## [[6]]$name
## [1] "Chett"
## 
## [[6]]$gender
## [1] "Male"
## 
## [[6]]$born
## [1] "At Hag's Mire"
## 
## 
## [[7]]
## [[7]]$name
## [1] "Cressen"
## 
## [[7]]$gender
## [1] "Male"
## 
## [[7]]$born
## [1] "In 219 AC or 220 AC"
## 
## 
## [[8]]
## [[8]]$name
## [1] "Arianne Martell"
## 
## [[8]]$gender
## [1] "Female"
## 
## [[8]]$born
## [1] "In 276 AC, at Sunspear"
## 
## 
## [[9]]
## [[9]]$name
## [1] "Daenerys Targaryen"
## 
## [[9]]$gender
## [1] "Female"
## 
## [[9]]$born
## [1] "In 284 AC, at Dragonstone"
## 
## 
## [[10]]
## [[10]]$name
## [1] "Davos Seaworth"
## 
## [[10]]$gender
## [1] "Male"
## 
## [[10]]$born
## [1] "In 260 AC or before, at King's Landing"
## 
## 
## [[11]]
## [[11]]$name
## [1] "Arya Stark"
## 
## [[11]]$gender
## [1] "Female"
## 
## [[11]]$born
## [1] "In 289 AC, at Winterfell"
## 
## 
## [[12]]
## [[12]]$name
## [1] "Arys Oakheart"
## 
## [[12]]$gender
## [1] "Male"
## 
## [[12]]$born
## [1] "At Old Oak"
## 
## 
## [[13]]
## [[13]]$name
## [1] "Asha Greyjoy"
## 
## [[13]]$gender
## [1] "Female"
## 
## [[13]]$born
## [1] "In 275 AC or 276 AC, at Pyke"
## 
## 
## [[14]]
## [[14]]$name
## [1] "Barristan Selmy"
## 
## [[14]]$gender
## [1] "Male"
## 
## [[14]]$born
## [1] "In 237 AC"
## 
## 
## [[15]]
## [[15]]$name
## [1] "Varamyr"
## 
## [[15]]$gender
## [1] "Male"
## 
## [[15]]$born
## [1] "At a village Beyond the Wall"
## 
## 
## [[16]]
## [[16]]$name
## [1] "Brandon Stark"
## 
## [[16]]$gender
## [1] "Male"
## 
## [[16]]$born
## [1] "In 290 AC, at Winterfell"
## 
## 
## [[17]]
## [[17]]$name
## [1] "Brienne of Tarth"
## 
## [[17]]$gender
## [1] "Female"
## 
## [[17]]$born
## [1] "In 280 AC"
## 
## 
## [[18]]
## [[18]]$name
## [1] "Catelyn Stark"
## 
## [[18]]$gender
## [1] "Female"
## 
## [[18]]$born
## [1] "In 264 AC, at Riverrun"
## 
## 
## [[19]]
## [[19]]$name
## [1] "Cersei Lannister"
## 
## [[19]]$gender
## [1] "Female"
## 
## [[19]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[20]]
## [[20]]$name
## [1] "Eddard Stark"
## 
## [[20]]$gender
## [1] "Male"
## 
## [[20]]$born
## [1] "In 263 AC, at Winterfell"
## 
## 
## [[21]]
## [[21]]$name
## [1] "Jaime Lannister"
## 
## [[21]]$gender
## [1] "Male"
## 
## [[21]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[22]]
## [[22]]$name
## [1] "Jon Connington"
## 
## [[22]]$gender
## [1] "Male"
## 
## [[22]]$born
## [1] "In or between 263 AC and 265 AC"
## 
## 
## [[23]]
## [[23]]$name
## [1] "Jon Snow"
## 
## [[23]]$gender
## [1] "Male"
## 
## [[23]]$born
## [1] "In 283 AC"
## 
## 
## [[24]]
## [[24]]$name
## [1] "Aeron Greyjoy"
## 
## [[24]]$gender
## [1] "Male"
## 
## [[24]]$born
## [1] "In or between 269 AC and 273 AC, at Pyke"
## 
## 
## [[25]]
## [[25]]$name
## [1] "Kevan Lannister"
## 
## [[25]]$gender
## [1] "Male"
## 
## [[25]]$born
## [1] "In 244 AC"
## 
## 
## [[26]]
## [[26]]$name
## [1] "Melisandre"
## 
## [[26]]$gender
## [1] "Female"
## 
## [[26]]$born
## [1] "At Unknown"
## 
## 
## [[27]]
## [[27]]$name
## [1] "Merrett Frey"
## 
## [[27]]$gender
## [1] "Male"
## 
## [[27]]$born
## [1] "In 262 AC"
## 
## 
## [[28]]
## [[28]]$name
## [1] "Quentyn Martell"
## 
## [[28]]$gender
## [1] "Male"
## 
## [[28]]$born
## [1] "In 281 AC, at Sunspear, Dorne"
## 
## 
## [[29]]
## [[29]]$name
## [1] "Samwell Tarly"
## 
## [[29]]$gender
## [1] "Male"
## 
## [[29]]$born
## [1] "In 283 AC, at Horn Hill"
## 
## 
## [[30]]
## [[30]]$name
## [1] "Sansa Stark"
## 
## [[30]]$gender
## [1] "Female"
## 
## [[30]]$born
## [1] "In 286 AC, at Winterfell"
```

```r
got_chars %>% map(magrittr::extract, c(3, 4, 6))
```

```
## [[1]]
## [[1]]$name
## [1] "Theon Greyjoy"
## 
## [[1]]$gender
## [1] "Male"
## 
## [[1]]$born
## [1] "In 278 AC or 279 AC, at Pyke"
## 
## 
## [[2]]
## [[2]]$name
## [1] "Tyrion Lannister"
## 
## [[2]]$gender
## [1] "Male"
## 
## [[2]]$born
## [1] "In 273 AC, at Casterly Rock"
## 
## 
## [[3]]
## [[3]]$name
## [1] "Victarion Greyjoy"
## 
## [[3]]$gender
## [1] "Male"
## 
## [[3]]$born
## [1] "In 268 AC or before, at Pyke"
## 
## 
## [[4]]
## [[4]]$name
## [1] "Will"
## 
## [[4]]$gender
## [1] "Male"
## 
## [[4]]$born
## [1] ""
## 
## 
## [[5]]
## [[5]]$name
## [1] "Areo Hotah"
## 
## [[5]]$gender
## [1] "Male"
## 
## [[5]]$born
## [1] "In 257 AC or before, at Norvos"
## 
## 
## [[6]]
## [[6]]$name
## [1] "Chett"
## 
## [[6]]$gender
## [1] "Male"
## 
## [[6]]$born
## [1] "At Hag's Mire"
## 
## 
## [[7]]
## [[7]]$name
## [1] "Cressen"
## 
## [[7]]$gender
## [1] "Male"
## 
## [[7]]$born
## [1] "In 219 AC or 220 AC"
## 
## 
## [[8]]
## [[8]]$name
## [1] "Arianne Martell"
## 
## [[8]]$gender
## [1] "Female"
## 
## [[8]]$born
## [1] "In 276 AC, at Sunspear"
## 
## 
## [[9]]
## [[9]]$name
## [1] "Daenerys Targaryen"
## 
## [[9]]$gender
## [1] "Female"
## 
## [[9]]$born
## [1] "In 284 AC, at Dragonstone"
## 
## 
## [[10]]
## [[10]]$name
## [1] "Davos Seaworth"
## 
## [[10]]$gender
## [1] "Male"
## 
## [[10]]$born
## [1] "In 260 AC or before, at King's Landing"
## 
## 
## [[11]]
## [[11]]$name
## [1] "Arya Stark"
## 
## [[11]]$gender
## [1] "Female"
## 
## [[11]]$born
## [1] "In 289 AC, at Winterfell"
## 
## 
## [[12]]
## [[12]]$name
## [1] "Arys Oakheart"
## 
## [[12]]$gender
## [1] "Male"
## 
## [[12]]$born
## [1] "At Old Oak"
## 
## 
## [[13]]
## [[13]]$name
## [1] "Asha Greyjoy"
## 
## [[13]]$gender
## [1] "Female"
## 
## [[13]]$born
## [1] "In 275 AC or 276 AC, at Pyke"
## 
## 
## [[14]]
## [[14]]$name
## [1] "Barristan Selmy"
## 
## [[14]]$gender
## [1] "Male"
## 
## [[14]]$born
## [1] "In 237 AC"
## 
## 
## [[15]]
## [[15]]$name
## [1] "Varamyr"
## 
## [[15]]$gender
## [1] "Male"
## 
## [[15]]$born
## [1] "At a village Beyond the Wall"
## 
## 
## [[16]]
## [[16]]$name
## [1] "Brandon Stark"
## 
## [[16]]$gender
## [1] "Male"
## 
## [[16]]$born
## [1] "In 290 AC, at Winterfell"
## 
## 
## [[17]]
## [[17]]$name
## [1] "Brienne of Tarth"
## 
## [[17]]$gender
## [1] "Female"
## 
## [[17]]$born
## [1] "In 280 AC"
## 
## 
## [[18]]
## [[18]]$name
## [1] "Catelyn Stark"
## 
## [[18]]$gender
## [1] "Female"
## 
## [[18]]$born
## [1] "In 264 AC, at Riverrun"
## 
## 
## [[19]]
## [[19]]$name
## [1] "Cersei Lannister"
## 
## [[19]]$gender
## [1] "Female"
## 
## [[19]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[20]]
## [[20]]$name
## [1] "Eddard Stark"
## 
## [[20]]$gender
## [1] "Male"
## 
## [[20]]$born
## [1] "In 263 AC, at Winterfell"
## 
## 
## [[21]]
## [[21]]$name
## [1] "Jaime Lannister"
## 
## [[21]]$gender
## [1] "Male"
## 
## [[21]]$born
## [1] "In 266 AC, at Casterly Rock"
## 
## 
## [[22]]
## [[22]]$name
## [1] "Jon Connington"
## 
## [[22]]$gender
## [1] "Male"
## 
## [[22]]$born
## [1] "In or between 263 AC and 265 AC"
## 
## 
## [[23]]
## [[23]]$name
## [1] "Jon Snow"
## 
## [[23]]$gender
## [1] "Male"
## 
## [[23]]$born
## [1] "In 283 AC"
## 
## 
## [[24]]
## [[24]]$name
## [1] "Aeron Greyjoy"
## 
## [[24]]$gender
## [1] "Male"
## 
## [[24]]$born
## [1] "In or between 269 AC and 273 AC, at Pyke"
## 
## 
## [[25]]
## [[25]]$name
## [1] "Kevan Lannister"
## 
## [[25]]$gender
## [1] "Male"
## 
## [[25]]$born
## [1] "In 244 AC"
## 
## 
## [[26]]
## [[26]]$name
## [1] "Melisandre"
## 
## [[26]]$gender
## [1] "Female"
## 
## [[26]]$born
## [1] "At Unknown"
## 
## 
## [[27]]
## [[27]]$name
## [1] "Merrett Frey"
## 
## [[27]]$gender
## [1] "Male"
## 
## [[27]]$born
## [1] "In 262 AC"
## 
## 
## [[28]]
## [[28]]$name
## [1] "Quentyn Martell"
## 
## [[28]]$gender
## [1] "Male"
## 
## [[28]]$born
## [1] "In 281 AC, at Sunspear, Dorne"
## 
## 
## [[29]]
## [[29]]$name
## [1] "Samwell Tarly"
## 
## [[29]]$gender
## [1] "Male"
## 
## [[29]]$born
## [1] "In 283 AC, at Horn Hill"
## 
## 
## [[30]]
## [[30]]$name
## [1] "Sansa Stark"
## 
## [[30]]$gender
## [1] "Female"
## 
## [[30]]$born
## [1] "In 286 AC, at Winterfell"
```

### Data frame output


```r
got_chars %>% map_dfr(`[`, c("id", "name", "gender", "alive"))
```

```
## # A tibble: 30 x 4
##       id name               gender alive
##    <int> <chr>              <chr>  <lgl>
##  1  1022 Theon Greyjoy      Male   TRUE 
##  2  1052 Tyrion Lannister   Male   TRUE 
##  3  1074 Victarion Greyjoy  Male   TRUE 
##  4  1109 Will               Male   FALSE
##  5  1166 Areo Hotah         Male   TRUE 
##  6  1267 Chett              Male   FALSE
##  7  1295 Cressen            Male   FALSE
##  8   130 Arianne Martell    Female TRUE 
##  9  1303 Daenerys Targaryen Female TRUE 
## 10  1319 Davos Seaworth     Male   TRUE 
## # ... with 20 more rows
```

```r
got_chars %>% tibble(id = map_int(., "id"),
		 name = map_chr(., "name"))
```

```
## # A tibble: 30 x 3
##    .                    id name              
##    <list>            <int> <chr>             
##  1 <named list [18]>  1022 Theon Greyjoy     
##  2 <named list [18]>  1052 Tyrion Lannister  
##  3 <named list [18]>  1074 Victarion Greyjoy 
##  4 <named list [18]>  1109 Will              
##  5 <named list [18]>  1166 Areo Hotah        
##  6 <named list [18]>  1267 Chett             
##  7 <named list [18]>  1295 Cressen           
##  8 <named list [18]>   130 Arianne Martell   
##  9 <named list [18]>  1303 Daenerys Targaryen
## 10 <named list [18]>  1319 Davos Seaworth    
## # ... with 20 more rows
```

```r
got_chars %>% {tibble(id = map_int(., "id"),
		  name = map_chr(., "name"))}
```

```
## # A tibble: 30 x 2
##       id name              
##    <int> <chr>             
##  1  1022 Theon Greyjoy     
##  2  1052 Tyrion Lannister  
##  3  1074 Victarion Greyjoy 
##  4  1109 Will              
##  5  1166 Areo Hotah        
##  6  1267 Chett             
##  7  1295 Cressen           
##  8   130 Arianne Martell   
##  9  1303 Daenerys Targaryen
## 10  1319 Davos Seaworth    
## # ... with 20 more rows
```



---
title: lesson04_extract_elements.R
author: LY
date: '2022-05-17'

---
