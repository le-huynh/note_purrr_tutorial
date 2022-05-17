---
title: Explore the Lists
output:
    html_document:
      keep_md: TRUE
---


```r
library(tidyverse)
library(repurrrsive) # Examples of Lists and Dataframes
```

expose list exploration in a rendered .Rmd document


```r
library(listviewer)
listviewer::jsonedit(got_chars, mode = "view")
```

List `wesanderson`


```r
str(wesanderson)
```

```
## List of 15
##  $ GrandBudapest : chr [1:4] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
##  $ Moonrise1     : chr [1:4] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
##  $ Royal1        : chr [1:4] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
##  $ Moonrise2     : chr [1:4] "#798E87" "#C27D38" "#CCC591" "#29211F"
##  $ Cavalcanti    : chr [1:5] "#D8B70A" "#02401B" "#A2A475" "#81A88D" ...
##  $ Royal2        : chr [1:5] "#9A8822" "#F5CDB4" "#F8AFA8" "#FDDDA0" ...
##  $ GrandBudapest2: chr [1:4] "#E6A0C4" "#C6CDF7" "#D8A499" "#7294D4"
##  $ Moonrise3     : chr [1:5] "#85D4E3" "#F4B5BD" "#9C964A" "#CDC08C" ...
##  $ Chevalier     : chr [1:4] "#446455" "#FDD262" "#D3DDDC" "#C7B19C"
##  $ Zissou        : chr [1:5] "#3B9AB2" "#78B7C5" "#EBCC2A" "#E1AF00" ...
##  $ FantasticFox  : chr [1:5] "#DD8D29" "#E2D200" "#46ACC8" "#E58601" ...
##  $ Darjeeling    : chr [1:5] "#FF0000" "#00A08A" "#F2AD00" "#F98400" ...
##  $ Rushmore      : chr [1:5] "#E1BD6D" "#EABE94" "#0B775E" "#35274A" ...
##  $ BottleRocket  : chr [1:7] "#A42820" "#5F5647" "#9B110E" "#3F5151" ...
##  $ Darjeeling2   : chr [1:5] "#ECCBAE" "#046C9A" "#D69C4E" "#ABDDDE" ...
```

```r
str(wesanderson, list.len = 3)
```

```
## List of 15
##  $ GrandBudapest : chr [1:4] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
##  $ Moonrise1     : chr [1:4] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
##  $ Royal1        : chr [1:4] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
##   [list output truncated]
```

List `got_chars`


```r
str(got_chars, list.len = 3)
```

```
## List of 30
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1022"
##   ..$ id         : int 1022
##   ..$ name       : chr "Theon Greyjoy"
##   .. [list output truncated]
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1052"
##   ..$ id         : int 1052
##   ..$ name       : chr "Tyrion Lannister"
##   .. [list output truncated]
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1074"
##   ..$ id         : int 1074
##   ..$ name       : chr "Victarion Greyjoy"
##   .. [list output truncated]
##   [list output truncated]
```

```r
str(got_chars[[1]], list.len = 5)
```

```
## List of 18
##  $ url        : chr "https://www.anapioficeandfire.com/api/characters/1022"
##  $ id         : int 1022
##  $ name       : chr "Theon Greyjoy"
##  $ gender     : chr "Male"
##  $ culture    : chr "Ironborn"
##   [list output truncated]
```

List `gh_users` and `gh_repos`


```r
str(gh_users, list.len = 3)
```

```
## List of 6
##  $ :List of 30
##   ..$ login              : chr "gaborcsardi"
##   ..$ id                 : int 660288
##   ..$ avatar_url         : chr "https://avatars.githubusercontent.com/u/660288?v=3"
##   .. [list output truncated]
##  $ :List of 30
##   ..$ login              : chr "jennybc"
##   ..$ id                 : int 599454
##   ..$ avatar_url         : chr "https://avatars.githubusercontent.com/u/599454?v=3"
##   .. [list output truncated]
##  $ :List of 30
##   ..$ login              : chr "jtleek"
##   ..$ id                 : int 1571674
##   ..$ avatar_url         : chr "https://avatars.githubusercontent.com/u/1571674?v=3"
##   .. [list output truncated]
##   [list output truncated]
```

```r
str(gh_repos, list.len = 3)
```

```
## List of 6
##  $ :List of 30
##   ..$ :List of 68
##   .. ..$ id               : int 61160198
##   .. ..$ name             : chr "after"
##   .. ..$ full_name        : chr "gaborcsardi/after"
##   .. .. [list output truncated]
##   ..$ :List of 68
##   .. ..$ id               : int 40500181
##   .. ..$ name             : chr "argufy"
##   .. ..$ full_name        : chr "gaborcsardi/argufy"
##   .. .. [list output truncated]
##   ..$ :List of 68
##   .. ..$ id               : int 36442442
##   .. ..$ name             : chr "ask"
##   .. ..$ full_name        : chr "gaborcsardi/ask"
##   .. .. [list output truncated]
##   .. [list output truncated]
##  $ :List of 30
##   ..$ :List of 68
##   .. ..$ id               : int 14756210
##   .. ..$ name             : chr "2013-11_sfu"
##   .. ..$ full_name        : chr "jennybc/2013-11_sfu"
##   .. .. [list output truncated]
##   ..$ :List of 68
##   .. ..$ id               : int 14152301
##   .. ..$ name             : chr "2014-01-27-miami"
##   .. ..$ full_name        : chr "jennybc/2014-01-27-miami"
##   .. .. [list output truncated]
##   ..$ :List of 68
##   .. ..$ id               : int 18495266
##   .. ..$ name             : chr "2014-05-12-ubc"
##   .. ..$ full_name        : chr "jennybc/2014-05-12-ubc"
##   .. .. [list output truncated]
##   .. [list output truncated]
##  $ :List of 30
##   ..$ :List of 68
##   .. ..$ id               : int 41645119
##   .. ..$ name             : chr "advdatasci"
##   .. ..$ full_name        : chr "jtleek/advdatasci"
##   .. .. [list output truncated]
##   ..$ :List of 68
##   .. ..$ id               : int 47568815
##   .. ..$ name             : chr "advdatasci-swirl"
##   .. ..$ full_name        : chr "jtleek/advdatasci-swirl"
##   .. .. [list output truncated]
##   ..$ :List of 68
##   .. ..$ id               : int 65922328
##   .. ..$ name             : chr "advdatasci16"
##   .. ..$ full_name        : chr "jtleek/advdatasci16"
##   .. .. [list output truncated]
##   .. [list output truncated]
##   [list output truncated]
```

**Exercises**


```r
str(wesanderson, max.level = 0)
```

```
## List of 15
```

```r
str(wesanderson, max.level = 1)
```

```
## List of 15
##  $ GrandBudapest : chr [1:4] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
##  $ Moonrise1     : chr [1:4] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
##  $ Royal1        : chr [1:4] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
##  $ Moonrise2     : chr [1:4] "#798E87" "#C27D38" "#CCC591" "#29211F"
##  $ Cavalcanti    : chr [1:5] "#D8B70A" "#02401B" "#A2A475" "#81A88D" ...
##  $ Royal2        : chr [1:5] "#9A8822" "#F5CDB4" "#F8AFA8" "#FDDDA0" ...
##  $ GrandBudapest2: chr [1:4] "#E6A0C4" "#C6CDF7" "#D8A499" "#7294D4"
##  $ Moonrise3     : chr [1:5] "#85D4E3" "#F4B5BD" "#9C964A" "#CDC08C" ...
##  $ Chevalier     : chr [1:4] "#446455" "#FDD262" "#D3DDDC" "#C7B19C"
##  $ Zissou        : chr [1:5] "#3B9AB2" "#78B7C5" "#EBCC2A" "#E1AF00" ...
##  $ FantasticFox  : chr [1:5] "#DD8D29" "#E2D200" "#46ACC8" "#E58601" ...
##  $ Darjeeling    : chr [1:5] "#FF0000" "#00A08A" "#F2AD00" "#F98400" ...
##  $ Rushmore      : chr [1:5] "#E1BD6D" "#EABE94" "#0B775E" "#35274A" ...
##  $ BottleRocket  : chr [1:7] "#A42820" "#5F5647" "#9B110E" "#3F5151" ...
##  $ Darjeeling2   : chr [1:5] "#ECCBAE" "#046C9A" "#D69C4E" "#ABDDDE" ...
```

```r
str(wesanderson, max.level = 2)
```

```
## List of 15
##  $ GrandBudapest : chr [1:4] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
##  $ Moonrise1     : chr [1:4] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
##  $ Royal1        : chr [1:4] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
##  $ Moonrise2     : chr [1:4] "#798E87" "#C27D38" "#CCC591" "#29211F"
##  $ Cavalcanti    : chr [1:5] "#D8B70A" "#02401B" "#A2A475" "#81A88D" ...
##  $ Royal2        : chr [1:5] "#9A8822" "#F5CDB4" "#F8AFA8" "#FDDDA0" ...
##  $ GrandBudapest2: chr [1:4] "#E6A0C4" "#C6CDF7" "#D8A499" "#7294D4"
##  $ Moonrise3     : chr [1:5] "#85D4E3" "#F4B5BD" "#9C964A" "#CDC08C" ...
##  $ Chevalier     : chr [1:4] "#446455" "#FDD262" "#D3DDDC" "#C7B19C"
##  $ Zissou        : chr [1:5] "#3B9AB2" "#78B7C5" "#EBCC2A" "#E1AF00" ...
##  $ FantasticFox  : chr [1:5] "#DD8D29" "#E2D200" "#46ACC8" "#E58601" ...
##  $ Darjeeling    : chr [1:5] "#FF0000" "#00A08A" "#F2AD00" "#F98400" ...
##  $ Rushmore      : chr [1:5] "#E1BD6D" "#EABE94" "#0B775E" "#35274A" ...
##  $ BottleRocket  : chr [1:7] "#A42820" "#5F5647" "#9B110E" "#3F5151" ...
##  $ Darjeeling2   : chr [1:5] "#ECCBAE" "#046C9A" "#D69C4E" "#ABDDDE" ...
```

```r
str(got_chars, max.level = 0)
```

```
## List of 30
```

```r
str(got_chars, max.level = 1)
```

```
## List of 30
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
##  $ :List of 18
```

```r
str(got_chars, max.level = 2)
```

```
## List of 30
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1022"
##   ..$ id         : int 1022
##   ..$ name       : chr "Theon Greyjoy"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Ironborn"
##   ..$ born       : chr "In 278 AC or 279 AC, at Pyke"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:3] "Prince of Winterfell" "Captain of Sea Bitch" "Lord of the Iron Islands (by law of the green lands)"
##   ..$ aliases    : chr [1:4] "Prince of Fools" "Theon Turncloak" "Reek" "Theon Kinslayer"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Greyjoy of Pyke"
##   ..$ books      : chr [1:3] "A Game of Thrones" "A Storm of Swords" "A Feast for Crows"
##   ..$ povBooks   : chr [1:2] "A Clash of Kings" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Alfie Allen"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1052"
##   ..$ id         : int 1052
##   ..$ name       : chr "Tyrion Lannister"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr ""
##   ..$ born       : chr "In 273 AC, at Casterly Rock"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:2] "Acting Hand of the King (former)" "Master of Coin (former)"
##   ..$ aliases    : chr [1:11] "The Imp" "Halfman" "The boyman" "Giant of Lannister" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/2044"
##   ..$ allegiances: chr "House Lannister of Casterly Rock"
##   ..$ books      : chr [1:2] "A Feast for Crows" "The World of Ice and Fire"
##   ..$ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Peter Dinklage"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1074"
##   ..$ id         : int 1074
##   ..$ name       : chr "Victarion Greyjoy"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Ironborn"
##   ..$ born       : chr "In 268 AC or before, at Pyke"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:2] "Lord Captain of the Iron Fleet" "Master of the Iron Victory"
##   ..$ aliases    : chr "The Iron Captain"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Greyjoy of Pyke"
##   ..$ books      : chr [1:3] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords"
##   ..$ povBooks   : chr [1:2] "A Feast for Crows" "A Dance with Dragons"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1109"
##   ..$ id         : int 1109
##   ..$ name       : chr "Will"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr ""
##   ..$ born       : chr ""
##   ..$ died       : chr "In 297 AC, at Haunted Forest"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: list()
##   ..$ books      : chr "A Clash of Kings"
##   ..$ povBooks   : chr "A Game of Thrones"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr "Bronson Webb"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1166"
##   ..$ id         : int 1166
##   ..$ name       : chr "Areo Hotah"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Norvoshi"
##   ..$ born       : chr "In 257 AC or before, at Norvos"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr "Captain of the Guard at Sunspear"
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Nymeros Martell of Sunspear"
##   ..$ books      : chr [1:3] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords"
##   ..$ povBooks   : chr [1:2] "A Feast for Crows" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:2] "Season 5" "Season 6"
##   ..$ playedBy   : chr "DeObia Oparei"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1267"
##   ..$ id         : int 1267
##   ..$ name       : chr "Chett"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr ""
##   ..$ born       : chr "At Hag's Mire"
##   ..$ died       : chr "In 299 AC, at Fist of the First Men"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: list()
##   ..$ books      : chr [1:2] "A Game of Thrones" "A Clash of Kings"
##   ..$ povBooks   : chr "A Storm of Swords"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1295"
##   ..$ id         : int 1295
##   ..$ name       : chr "Cressen"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr ""
##   ..$ born       : chr "In 219 AC or 220 AC"
##   ..$ died       : chr "In 299 AC, at Dragonstone"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr "Maester"
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: list()
##   ..$ books      : chr [1:2] "A Storm of Swords" "A Feast for Crows"
##   ..$ povBooks   : chr "A Clash of Kings"
##   ..$ tvSeries   : chr "Season 2"
##   ..$ playedBy   : chr "Oliver Ford"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/130"
##   ..$ id         : int 130
##   ..$ name       : chr "Arianne Martell"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Dornish"
##   ..$ born       : chr "In 276 AC, at Sunspear"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr "Princess of Dorne"
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Nymeros Martell of Sunspear"
##   ..$ books      : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ povBooks   : chr "A Feast for Crows"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1303"
##   ..$ id         : int 1303
##   ..$ name       : chr "Daenerys Targaryen"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Valyrian"
##   ..$ born       : chr "In 284 AC, at Dragonstone"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:5] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms" "Khaleesi of the Great Grass Sea" "Breaker of Shackles/Chains" "Queen of Meereen" ...
##   ..$ aliases    : chr [1:11] "Dany" "Daenerys Stormborn" "The Unburnt" "Mother of Dragons" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/1346"
##   ..$ allegiances: chr "House Targaryen of King's Landing"
##   ..$ books      : chr "A Feast for Crows"
##   ..$ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Emilia Clarke"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1319"
##   ..$ id         : int 1319
##   ..$ name       : chr "Davos Seaworth"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Westeros"
##   ..$ born       : chr "In 260 AC or before, at King's Landing"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:4] "Ser" "Lord of the Rainwood" "Admiral of the Narrow Sea" "Hand of the King"
##   ..$ aliases    : chr [1:5] "Onion Knight" "Davos Shorthand" "Ser Onions" "Onion Lord" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/1676"
##   ..$ allegiances: chr [1:2] "House Baratheon of Dragonstone" "House Seaworth of Cape Wrath"
##   ..$ books      : chr "A Feast for Crows"
##   ..$ povBooks   : chr [1:3] "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:5] "Season 2" "Season 3" "Season 4" "Season 5" ...
##   ..$ playedBy   : chr "Liam Cunningham"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/148"
##   ..$ id         : int 148
##   ..$ name       : chr "Arya Stark"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Northmen"
##   ..$ born       : chr "In 289 AC, at Winterfell"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr "Princess"
##   ..$ aliases    : chr [1:16] "Arya Horseface" "Arya Underfoot" "Arry" "Lumpyface" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Stark of Winterfell"
##   ..$ books      : list()
##   ..$ povBooks   : chr [1:5] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Feast for Crows" ...
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Maisie Williams"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/149"
##   ..$ id         : int 149
##   ..$ name       : chr "Arys Oakheart"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Reach"
##   ..$ born       : chr "At Old Oak"
##   ..$ died       : chr "In 300 AC, at the Greenblood"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr "Ser"
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Oakheart of Old Oak"
##   ..$ books      : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ povBooks   : chr "A Feast for Crows"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/150"
##   ..$ id         : int 150
##   ..$ name       : chr "Asha Greyjoy"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Ironborn"
##   ..$ born       : chr "In 275 AC or 276 AC, at Pyke"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:3] "Princess" "Captain of the Black Wind" "Conqueror of Deepwood Motte"
##   ..$ aliases    : chr [1:2] "Esgred" "The Kraken's Daughter"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/1372"
##   ..$ allegiances: chr [1:2] "House Greyjoy of Pyke" "House Ironmaker"
##   ..$ books      : chr [1:2] "A Game of Thrones" "A Clash of Kings"
##   ..$ povBooks   : chr [1:2] "A Feast for Crows" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:3] "Season 2" "Season 3" "Season 4"
##   ..$ playedBy   : chr "Gemma Whelan"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/168"
##   ..$ id         : int 168
##   ..$ name       : chr "Barristan Selmy"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Westeros"
##   ..$ born       : chr "In 237 AC"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:2] "Ser" "Hand of the Queen"
##   ..$ aliases    : chr [1:5] "Barristan the Bold" "Arstan Whitebeard" "Ser Grandfather" "Barristan the Old" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr [1:2] "House Selmy of Harvest Hall" "House Targaryen of King's Landing"
##   ..$ books      : chr [1:5] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Feast for Crows" ...
##   ..$ povBooks   : chr "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:4] "Season 1" "Season 3" "Season 4" "Season 5"
##   ..$ playedBy   : chr "Ian McElhinney"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/2066"
##   ..$ id         : int 2066
##   ..$ name       : chr "Varamyr"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Free Folk"
##   ..$ born       : chr "At a village Beyond the Wall"
##   ..$ died       : chr "In 300 AC, at a village Beyond the Wall"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr [1:3] "Varamyr Sixskins" "Haggon" "Lump"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: list()
##   ..$ books      : chr "A Storm of Swords"
##   ..$ povBooks   : chr "A Dance with Dragons"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/208"
##   ..$ id         : int 208
##   ..$ name       : chr "Brandon Stark"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Northmen"
##   ..$ born       : chr "In 290 AC, at Winterfell"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr "Prince of Winterfell"
##   ..$ aliases    : chr [1:3] "Bran" "Bran the Broken" "The Winged Wolf"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Stark of Winterfell"
##   ..$ books      : chr "A Feast for Crows"
##   ..$ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:5] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Isaac Hempstead-Wright"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/216"
##   ..$ id         : int 216
##   ..$ name       : chr "Brienne of Tarth"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr ""
##   ..$ born       : chr "In 280 AC"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr [1:3] "The Maid of Tarth" "Brienne the Beauty" "Brienne the Blue"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr [1:3] "House Baratheon of Storm's End" "House Stark of Winterfell" "House Tarth of Evenfall Hall"
##   ..$ books      : chr [1:3] "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ povBooks   : chr "A Feast for Crows"
##   ..$ tvSeries   : chr [1:5] "Season 2" "Season 3" "Season 4" "Season 5" ...
##   ..$ playedBy   : chr "Gwendoline Christie"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/232"
##   ..$ id         : int 232
##   ..$ name       : chr "Catelyn Stark"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Rivermen"
##   ..$ born       : chr "In 264 AC, at Riverrun"
##   ..$ died       : chr "In 299 AC, at the Twins"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr "Lady of Winterfell"
##   ..$ aliases    : chr [1:5] "Catelyn Tully" "Lady Stoneheart" "The Silent Sistet" "Mother Mercilesr" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/339"
##   ..$ allegiances: chr [1:2] "House Stark of Winterfell" "House Tully of Riverrun"
##   ..$ books      : chr [1:2] "A Feast for Crows" "A Dance with Dragons"
##   ..$ povBooks   : chr [1:3] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords"
##   ..$ tvSeries   : chr [1:3] "Season 1" "Season 2" "Season 3"
##   ..$ playedBy   : chr "Michelle Fairley"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/238"
##   ..$ id         : int 238
##   ..$ name       : chr "Cersei Lannister"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Westerman"
##   ..$ born       : chr "In 266 AC, at Casterly Rock"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:5] "Light of the West" "Queen Dowager" "Protector of the Realm" "Lady of Casterly Rock" ...
##   ..$ aliases    : list()
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/901"
##   ..$ allegiances: chr "House Lannister of Casterly Rock"
##   ..$ books      : chr [1:3] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords"
##   ..$ povBooks   : chr [1:2] "A Feast for Crows" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Lena Headey"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/339"
##   ..$ id         : int 339
##   ..$ name       : chr "Eddard Stark"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Northmen"
##   ..$ born       : chr "In 263 AC, at Winterfell"
##   ..$ died       : chr "In 299 AC, at Great Sept of Baelor in King's Landing"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr [1:5] "Lord of Winterfell" "Warden of the North" "Hand of the King" "Protector of the Realm" ...
##   ..$ aliases    : chr [1:3] "Ned" "The Ned" "The Quiet Wolf"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/232"
##   ..$ allegiances: chr "House Stark of Winterfell"
##   ..$ books      : chr [1:5] "A Clash of Kings" "A Storm of Swords" "A Feast for Crows" "A Dance with Dragons" ...
##   ..$ povBooks   : chr "A Game of Thrones"
##   ..$ tvSeries   : chr [1:2] "Season 1" "Season 6"
##   ..$ playedBy   : chr [1:3] "Sean Bean" "Sebastian Croft" "Robert Aramayo"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/529"
##   ..$ id         : int 529
##   ..$ name       : chr "Jaime Lannister"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Westerlands"
##   ..$ born       : chr "In 266 AC, at Casterly Rock"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:3] "Ser" "Lord Commander of the Kingsguard" "Warden of the East (formerly)"
##   ..$ aliases    : chr [1:4] "The Kingslayer" "The Lion of Lannister" "The Young Lion" "Cripple"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Lannister of Casterly Rock"
##   ..$ books      : chr [1:2] "A Game of Thrones" "A Clash of Kings"
##   ..$ povBooks   : chr [1:3] "A Storm of Swords" "A Feast for Crows" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:5] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Nikolaj Coster-Waldau"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/576"
##   ..$ id         : int 576
##   ..$ name       : chr "Jon Connington"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Stormlands"
##   ..$ born       : chr "In or between 263 AC and 265 AC"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:3] "Lord of Griffin's Roost" "Hand of the King" "Hand of the True King"
##   ..$ aliases    : chr "Griffthe Mad King's Hand"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr [1:2] "House Connington of Griffin's Roost" "House Targaryen of King's Landing"
##   ..$ books      : chr [1:3] "A Storm of Swords" "A Feast for Crows" "The World of Ice and Fire"
##   ..$ povBooks   : chr "A Dance with Dragons"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/583"
##   ..$ id         : int 583
##   ..$ name       : chr "Jon Snow"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Northmen"
##   ..$ born       : chr "In 283 AC"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr "Lord Commander of the Night's Watch"
##   ..$ aliases    : chr [1:8] "Lord Snow" "Ned Stark's Bastard" "The Snow of Winterfell" "The Crow-Come-Over" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Stark of Winterfell"
##   ..$ books      : chr "A Feast for Crows"
##   ..$ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Kit Harington"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/60"
##   ..$ id         : int 60
##   ..$ name       : chr "Aeron Greyjoy"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Ironborn"
##   ..$ born       : chr "In or between 269 AC and 273 AC, at Pyke"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr [1:2] "Priest of the Drowned God" "Captain of the Golden Storm (formerly)"
##   ..$ aliases    : chr [1:2] "The Damphair" "Aeron Damphair"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Greyjoy of Pyke"
##   ..$ books      : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
##   ..$ povBooks   : chr "A Feast for Crows"
##   ..$ tvSeries   : chr "Season 6"
##   ..$ playedBy   : chr "Michael Feast"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/605"
##   ..$ id         : int 605
##   ..$ name       : chr "Kevan Lannister"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr ""
##   ..$ born       : chr "In 244 AC"
##   ..$ died       : chr "In 300 AC, at King's Landing"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr [1:4] "Ser" "Master of laws" "Lord Regent" "Protector of the Realm"
##   ..$ aliases    : chr ""
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/327"
##   ..$ allegiances: chr "House Lannister of Casterly Rock"
##   ..$ books      : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Feast for Crows"
##   ..$ povBooks   : chr "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:4] "Season 1" "Season 2" "Season 5" "Season 6"
##   ..$ playedBy   : chr "Ian Gelder"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/743"
##   ..$ id         : int 743
##   ..$ name       : chr "Melisandre"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Asshai"
##   ..$ born       : chr "At Unknown"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr [1:5] "The Red Priestess" "The Red Woman" "The King's Red Shadow" "Lady Red" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: list()
##   ..$ books      : chr [1:3] "A Clash of Kings" "A Storm of Swords" "A Feast for Crows"
##   ..$ povBooks   : chr "A Dance with Dragons"
##   ..$ tvSeries   : chr [1:5] "Season 2" "Season 3" "Season 4" "Season 5" ...
##   ..$ playedBy   : chr "Carice van Houten"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/751"
##   ..$ id         : int 751
##   ..$ name       : chr "Merrett Frey"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Rivermen"
##   ..$ born       : chr "In 262 AC"
##   ..$ died       : chr "In 300 AC, at Near Oldstones"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr "Merrett Muttonhead"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/712"
##   ..$ allegiances: chr "House Frey of the Crossing"
##   ..$ books      : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Feast for Crows" "A Dance with Dragons"
##   ..$ povBooks   : chr "A Storm of Swords"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/844"
##   ..$ id         : int 844
##   ..$ name       : chr "Quentyn Martell"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Dornish"
##   ..$ born       : chr "In 281 AC, at Sunspear, Dorne"
##   ..$ died       : chr "In 300 AC, at Meereen"
##   ..$ alive      : logi FALSE
##   ..$ titles     : chr "Prince"
##   ..$ aliases    : chr [1:4] "Frog" "Prince Frog" "The prince who came too late" "The Dragonrider"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Nymeros Martell of Sunspear"
##   ..$ books      : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Feast for Crows"
##   ..$ povBooks   : chr "A Dance with Dragons"
##   ..$ tvSeries   : chr ""
##   ..$ playedBy   : chr ""
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/954"
##   ..$ id         : int 954
##   ..$ name       : chr "Samwell Tarly"
##   ..$ gender     : chr "Male"
##   ..$ culture    : chr "Andal"
##   ..$ born       : chr "In 283 AC, at Horn Hill"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr ""
##   ..$ aliases    : chr [1:7] "Sam" "Ser Piggy" "Prince Pork-chop" "Lady Piggy" ...
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr ""
##   ..$ allegiances: chr "House Tarly of Horn Hill"
##   ..$ books      : chr [1:3] "A Game of Thrones" "A Clash of Kings" "A Dance with Dragons"
##   ..$ povBooks   : chr [1:2] "A Storm of Swords" "A Feast for Crows"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "John Bradley-West"
##  $ :List of 18
##   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/957"
##   ..$ id         : int 957
##   ..$ name       : chr "Sansa Stark"
##   ..$ gender     : chr "Female"
##   ..$ culture    : chr "Northmen"
##   ..$ born       : chr "In 286 AC, at Winterfell"
##   ..$ died       : chr ""
##   ..$ alive      : logi TRUE
##   ..$ titles     : chr "Princess"
##   ..$ aliases    : chr [1:3] "Little bird" "Alayne Stone" "Jonquil"
##   ..$ father     : chr ""
##   ..$ mother     : chr ""
##   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/1052"
##   ..$ allegiances: chr [1:2] "House Baelish of Harrenhal" "House Stark of Winterfell"
##   ..$ books      : chr "A Dance with Dragons"
##   ..$ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Feast for Crows"
##   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
##   ..$ playedBy   : chr "Sophie Turner"
```



---
author: LY
date: '2022-05-17'

---
