---
title: Parallel mapping
output:
    html_document:
      keep_md: TRUE
---


```r
library(tidyverse)
library(repurrrsive)
```

## Three more ways to specify general .f:
- an existing function
- an anonymous function, defined on-the-fly
- a formula: unique to purrr


```r
df <- got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name"))

(df2 <- df[c("Sansa Stark", "Arya Stark", "Brandon Stark")])
```

```
## $`Sansa Stark`
## [1] "Little bird"  "Alayne Stone" "Jonquil"     
## 
## $`Arya Stark`
##  [1] "Arya Horseface"       "Arya Underfoot"       "Arry"                
##  [4] "Lumpyface"            "Lumpyhead"            "Stickboy"            
##  [7] "Weasel"               "Nymeria"              "Squan"               
## [10] "Saltb"                "Cat of the Canaly"    "Bets"                
## [13] "The Blind Girh"       "The Ugly Little Girl" "Mercedenl"           
## [16] "Mercye"              
## 
## $`Brandon Stark`
## [1] "Bran"            "Bran the Broken" "The Winged Wolf"
```

an existing function


```r
myfunc = function(x) paste(x, collapse = " | ")

df2 %>% map(myfunc)
```

```
## $`Sansa Stark`
## [1] "Little bird | Alayne Stone | Jonquil"
## 
## $`Arya Stark`
## [1] "Arya Horseface | Arya Underfoot | Arry | Lumpyface | Lumpyhead | Stickboy | Weasel | Nymeria | Squan | Saltb | Cat of the Canaly | Bets | The Blind Girh | The Ugly Little Girl | Mercedenl | Mercye"
## 
## $`Brandon Stark`
## [1] "Bran | Bran the Broken | The Winged Wolf"
```

an anonymous function


```r
df2 %>% map(function(x) paste(x, collapse = " | "))
```

```
## $`Sansa Stark`
## [1] "Little bird | Alayne Stone | Jonquil"
## 
## $`Arya Stark`
## [1] "Arya Horseface | Arya Underfoot | Arry | Lumpyface | Lumpyhead | Stickboy | Weasel | Nymeria | Squan | Saltb | Cat of the Canaly | Bets | The Blind Girh | The Ugly Little Girl | Mercedenl | Mercye"
## 
## $`Brandon Stark`
## [1] "Bran | Bran the Broken | The Winged Wolf"
```

```r
df2 %>% map(paste, collapse = " | ")
```

```
## $`Sansa Stark`
## [1] "Little bird | Alayne Stone | Jonquil"
## 
## $`Arya Stark`
## [1] "Arya Horseface | Arya Underfoot | Arry | Lumpyface | Lumpyhead | Stickboy | Weasel | Nymeria | Squan | Saltb | Cat of the Canaly | Bets | The Blind Girh | The Ugly Little Girl | Mercedenl | Mercye"
## 
## $`Brandon Stark`
## [1] "Bran | Bran the Broken | The Winged Wolf"
```

a formula: `.` = an individual element of the primary vector or list


```r
df2 %>% map(~ paste(., collapse = " | "))
```

```
## $`Sansa Stark`
## [1] "Little bird | Alayne Stone | Jonquil"
## 
## $`Arya Stark`
## [1] "Arya Horseface | Arya Underfoot | Arry | Lumpyface | Lumpyhead | Stickboy | Weasel | Nymeria | Squan | Saltb | Cat of the Canaly | Bets | The Blind Girh | The Ugly Little Girl | Mercedenl | Mercye"
## 
## $`Brandon Stark`
## [1] "Bran | Bran the Broken | The Winged Wolf"
```

List `got_chars`: pull out aliases of each character


```r
got_chars %>% 
	map("aliases")
```

```
## [[1]]
## [1] "Prince of Fools" "Theon Turncloak" "Reek"            "Theon Kinslayer"
## 
## [[2]]
##  [1] "The Imp"            "Halfman"            "The boyman"        
##  [4] "Giant of Lannister" "Lord Tywin's Doom"  "Lord Tywin's Bane" 
##  [7] "Yollo"              "Hugor Hill"         "No-Nose"           
## [10] "Freak"              "Dwarf"             
## 
## [[3]]
## [1] "The Iron Captain"
## 
## [[4]]
## [1] ""
## 
## [[5]]
## [1] ""
## 
## [[6]]
## [1] ""
## 
## [[7]]
## [1] ""
## 
## [[8]]
## [1] ""
## 
## [[9]]
##  [1] "Dany"                    "Daenerys Stormborn"     
##  [3] "The Unburnt"             "Mother of Dragons"      
##  [5] "Mother"                  "Mhysa"                  
##  [7] "The Silver Queen"        "Silver Lady"            
##  [9] "Dragonmother"            "The Dragon Queen"       
## [11] "The Mad King's daughter"
## 
## [[10]]
## [1] "Onion Knight"    "Davos Shorthand" "Ser Onions"      "Onion Lord"     
## [5] "Smuggler"       
## 
## [[11]]
##  [1] "Arya Horseface"       "Arya Underfoot"       "Arry"                
##  [4] "Lumpyface"            "Lumpyhead"            "Stickboy"            
##  [7] "Weasel"               "Nymeria"              "Squan"               
## [10] "Saltb"                "Cat of the Canaly"    "Bets"                
## [13] "The Blind Girh"       "The Ugly Little Girl" "Mercedenl"           
## [16] "Mercye"              
## 
## [[12]]
## [1] ""
## 
## [[13]]
## [1] "Esgred"                "The Kraken's Daughter"
## 
## [[14]]
## [1] "Barristan the Bold" "Arstan Whitebeard"  "Ser Grandfather"   
## [4] "Barristan the Old"  "Old Ser"           
## 
## [[15]]
## [1] "Varamyr Sixskins" "Haggon"           "Lump"            
## 
## [[16]]
## [1] "Bran"            "Bran the Broken" "The Winged Wolf"
## 
## [[17]]
## [1] "The Maid of Tarth"  "Brienne the Beauty" "Brienne the Blue"  
## 
## [[18]]
## [1] "Catelyn Tully"     "Lady Stoneheart"   "The Silent Sistet"
## [4] "Mother Mercilesr"  "The Hangwomans"   
## 
## [[19]]
## NULL
## 
## [[20]]
## [1] "Ned"            "The Ned"        "The Quiet Wolf"
## 
## [[21]]
## [1] "The Kingslayer"        "The Lion of Lannister" "The Young Lion"       
## [4] "Cripple"              
## 
## [[22]]
## [1] "Griffthe Mad King's Hand"
## 
## [[23]]
## [1] "Lord Snow"                                    
## [2] "Ned Stark's Bastard"                          
## [3] "The Snow of Winterfell"                       
## [4] "The Crow-Come-Over"                           
## [5] "The 998th Lord Commander of the Night's Watch"
## [6] "The Bastard of Winterfell"                    
## [7] "The Black Bastard of the Wall"                
## [8] "Lord Crow"                                    
## 
## [[24]]
## [1] "The Damphair"   "Aeron Damphair"
## 
## [[25]]
## [1] ""
## 
## [[26]]
## [1] "The Red Priestess"     "The Red Woman"         "The King's Red Shadow"
## [4] "Lady Red"              "Lot Seven"            
## 
## [[27]]
## [1] "Merrett Muttonhead"
## 
## [[28]]
## [1] "Frog"                         "Prince Frog"                 
## [3] "The prince who came too late" "The Dragonrider"             
## 
## [[29]]
## [1] "Sam"              "Ser Piggy"        "Prince Pork-chop" "Lady Piggy"      
## [5] "Sam the Slayer"   "Black Sam"        "Lord of Ham"     
## 
## [[30]]
## [1] "Little bird"  "Alayne Stone" "Jonquil"
```

```r
got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name"))
```

```
## $`Theon Greyjoy`
## [1] "Prince of Fools" "Theon Turncloak" "Reek"            "Theon Kinslayer"
## 
## $`Tyrion Lannister`
##  [1] "The Imp"            "Halfman"            "The boyman"        
##  [4] "Giant of Lannister" "Lord Tywin's Doom"  "Lord Tywin's Bane" 
##  [7] "Yollo"              "Hugor Hill"         "No-Nose"           
## [10] "Freak"              "Dwarf"             
## 
## $`Victarion Greyjoy`
## [1] "The Iron Captain"
## 
## $Will
## [1] ""
## 
## $`Areo Hotah`
## [1] ""
## 
## $Chett
## [1] ""
## 
## $Cressen
## [1] ""
## 
## $`Arianne Martell`
## [1] ""
## 
## $`Daenerys Targaryen`
##  [1] "Dany"                    "Daenerys Stormborn"     
##  [3] "The Unburnt"             "Mother of Dragons"      
##  [5] "Mother"                  "Mhysa"                  
##  [7] "The Silver Queen"        "Silver Lady"            
##  [9] "Dragonmother"            "The Dragon Queen"       
## [11] "The Mad King's daughter"
## 
## $`Davos Seaworth`
## [1] "Onion Knight"    "Davos Shorthand" "Ser Onions"      "Onion Lord"     
## [5] "Smuggler"       
## 
## $`Arya Stark`
##  [1] "Arya Horseface"       "Arya Underfoot"       "Arry"                
##  [4] "Lumpyface"            "Lumpyhead"            "Stickboy"            
##  [7] "Weasel"               "Nymeria"              "Squan"               
## [10] "Saltb"                "Cat of the Canaly"    "Bets"                
## [13] "The Blind Girh"       "The Ugly Little Girl" "Mercedenl"           
## [16] "Mercye"              
## 
## $`Arys Oakheart`
## [1] ""
## 
## $`Asha Greyjoy`
## [1] "Esgred"                "The Kraken's Daughter"
## 
## $`Barristan Selmy`
## [1] "Barristan the Bold" "Arstan Whitebeard"  "Ser Grandfather"   
## [4] "Barristan the Old"  "Old Ser"           
## 
## $Varamyr
## [1] "Varamyr Sixskins" "Haggon"           "Lump"            
## 
## $`Brandon Stark`
## [1] "Bran"            "Bran the Broken" "The Winged Wolf"
## 
## $`Brienne of Tarth`
## [1] "The Maid of Tarth"  "Brienne the Beauty" "Brienne the Blue"  
## 
## $`Catelyn Stark`
## [1] "Catelyn Tully"     "Lady Stoneheart"   "The Silent Sistet"
## [4] "Mother Mercilesr"  "The Hangwomans"   
## 
## $`Cersei Lannister`
## NULL
## 
## $`Eddard Stark`
## [1] "Ned"            "The Ned"        "The Quiet Wolf"
## 
## $`Jaime Lannister`
## [1] "The Kingslayer"        "The Lion of Lannister" "The Young Lion"       
## [4] "Cripple"              
## 
## $`Jon Connington`
## [1] "Griffthe Mad King's Hand"
## 
## $`Jon Snow`
## [1] "Lord Snow"                                    
## [2] "Ned Stark's Bastard"                          
## [3] "The Snow of Winterfell"                       
## [4] "The Crow-Come-Over"                           
## [5] "The 998th Lord Commander of the Night's Watch"
## [6] "The Bastard of Winterfell"                    
## [7] "The Black Bastard of the Wall"                
## [8] "Lord Crow"                                    
## 
## $`Aeron Greyjoy`
## [1] "The Damphair"   "Aeron Damphair"
## 
## $`Kevan Lannister`
## [1] ""
## 
## $Melisandre
## [1] "The Red Priestess"     "The Red Woman"         "The King's Red Shadow"
## [4] "Lady Red"              "Lot Seven"            
## 
## $`Merrett Frey`
## [1] "Merrett Muttonhead"
## 
## $`Quentyn Martell`
## [1] "Frog"                         "Prince Frog"                 
## [3] "The prince who came too late" "The Dragonrider"             
## 
## $`Samwell Tarly`
## [1] "Sam"              "Ser Piggy"        "Prince Pork-chop" "Lady Piggy"      
## [5] "Sam the Slayer"   "Black Sam"        "Lord of Ham"     
## 
## $`Sansa Stark`
## [1] "Little bird"  "Alayne Stone" "Jonquil"
```

```r
got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name")) %>%
	enframe("name", "aliases")
```

```
## # A tibble: 30 x 2
##    name               aliases   
##    <chr>              <list>    
##  1 Theon Greyjoy      <chr [4]> 
##  2 Tyrion Lannister   <chr [11]>
##  3 Victarion Greyjoy  <chr [1]> 
##  4 Will               <chr [1]> 
##  5 Areo Hotah         <chr [1]> 
##  6 Chett              <chr [1]> 
##  7 Cressen            <chr [1]> 
##  8 Arianne Martell    <chr [1]> 
##  9 Daenerys Targaryen <chr [11]>
## 10 Davos Seaworth     <chr [5]> 
## # ... with 20 more rows
```

```r
got_chars %>% 
	map("aliases") %>%
	set_names(map_chr(got_chars, "name")) %>%
	enframe("name", "aliases") %>%
	unnest(aliases)
```

```
## # A tibble: 114 x 2
##    name             aliases           
##    <chr>            <chr>             
##  1 Theon Greyjoy    Prince of Fools   
##  2 Theon Greyjoy    Theon Turncloak   
##  3 Theon Greyjoy    Reek              
##  4 Theon Greyjoy    Theon Kinslayer   
##  5 Tyrion Lannister The Imp           
##  6 Tyrion Lannister Halfman           
##  7 Tyrion Lannister The boyman        
##  8 Tyrion Lannister Giant of Lannister
##  9 Tyrion Lannister Lord Tywin's Doom 
## 10 Tyrion Lannister Lord Tywin's Bane 
## # ... with 104 more rows
```

## Exercises


```r
got_chars %>% 
	map("allegiances") %>%
	set_names(map_chr(got_chars, "name"))
```

```
## $`Theon Greyjoy`
## [1] "House Greyjoy of Pyke"
## 
## $`Tyrion Lannister`
## [1] "House Lannister of Casterly Rock"
## 
## $`Victarion Greyjoy`
## [1] "House Greyjoy of Pyke"
## 
## $Will
## NULL
## 
## $`Areo Hotah`
## [1] "House Nymeros Martell of Sunspear"
## 
## $Chett
## NULL
## 
## $Cressen
## NULL
## 
## $`Arianne Martell`
## [1] "House Nymeros Martell of Sunspear"
## 
## $`Daenerys Targaryen`
## [1] "House Targaryen of King's Landing"
## 
## $`Davos Seaworth`
## [1] "House Baratheon of Dragonstone" "House Seaworth of Cape Wrath"  
## 
## $`Arya Stark`
## [1] "House Stark of Winterfell"
## 
## $`Arys Oakheart`
## [1] "House Oakheart of Old Oak"
## 
## $`Asha Greyjoy`
## [1] "House Greyjoy of Pyke" "House Ironmaker"      
## 
## $`Barristan Selmy`
## [1] "House Selmy of Harvest Hall"       "House Targaryen of King's Landing"
## 
## $Varamyr
## NULL
## 
## $`Brandon Stark`
## [1] "House Stark of Winterfell"
## 
## $`Brienne of Tarth`
## [1] "House Baratheon of Storm's End" "House Stark of Winterfell"     
## [3] "House Tarth of Evenfall Hall"  
## 
## $`Catelyn Stark`
## [1] "House Stark of Winterfell" "House Tully of Riverrun"  
## 
## $`Cersei Lannister`
## [1] "House Lannister of Casterly Rock"
## 
## $`Eddard Stark`
## [1] "House Stark of Winterfell"
## 
## $`Jaime Lannister`
## [1] "House Lannister of Casterly Rock"
## 
## $`Jon Connington`
## [1] "House Connington of Griffin's Roost" "House Targaryen of King's Landing"  
## 
## $`Jon Snow`
## [1] "House Stark of Winterfell"
## 
## $`Aeron Greyjoy`
## [1] "House Greyjoy of Pyke"
## 
## $`Kevan Lannister`
## [1] "House Lannister of Casterly Rock"
## 
## $Melisandre
## NULL
## 
## $`Merrett Frey`
## [1] "House Frey of the Crossing"
## 
## $`Quentyn Martell`
## [1] "House Nymeros Martell of Sunspear"
## 
## $`Samwell Tarly`
## [1] "House Tarly of Horn Hill"
## 
## $`Sansa Stark`
## [1] "House Baelish of Harrenhal" "House Stark of Winterfell"
```

```r
got_chars %>% 
	map("allegiances") %>%
	set_names(map_chr(got_chars, "name")) %>%
	map(~ paste(., collapse = " | ")) %>%
	enframe("name", "allegiances") %>%
	unnest("allegiances")
```

```
## # A tibble: 30 x 2
##    name               allegiances                                               
##    <chr>              <chr>                                                     
##  1 Theon Greyjoy      "House Greyjoy of Pyke"                                   
##  2 Tyrion Lannister   "House Lannister of Casterly Rock"                        
##  3 Victarion Greyjoy  "House Greyjoy of Pyke"                                   
##  4 Will               ""                                                        
##  5 Areo Hotah         "House Nymeros Martell of Sunspear"                       
##  6 Chett              ""                                                        
##  7 Cressen            ""                                                        
##  8 Arianne Martell    "House Nymeros Martell of Sunspear"                       
##  9 Daenerys Targaryen "House Targaryen of King's Landing"                       
## 10 Davos Seaworth     "House Baratheon of Dragonstone | House Seaworth of Cape ~
## # ... with 20 more rows
```

# Parallel map:
## `map2()`


```r
(nms <- got_chars %>% map_chr("name"))
```

```
##  [1] "Theon Greyjoy"      "Tyrion Lannister"   "Victarion Greyjoy" 
##  [4] "Will"               "Areo Hotah"         "Chett"             
##  [7] "Cressen"            "Arianne Martell"    "Daenerys Targaryen"
## [10] "Davos Seaworth"     "Arya Stark"         "Arys Oakheart"     
## [13] "Asha Greyjoy"       "Barristan Selmy"    "Varamyr"           
## [16] "Brandon Stark"      "Brienne of Tarth"   "Catelyn Stark"     
## [19] "Cersei Lannister"   "Eddard Stark"       "Jaime Lannister"   
## [22] "Jon Connington"     "Jon Snow"           "Aeron Greyjoy"     
## [25] "Kevan Lannister"    "Melisandre"         "Merrett Frey"      
## [28] "Quentyn Martell"    "Samwell Tarly"      "Sansa Stark"
```

```r
(birth <- got_chars %>% map_chr("born"))
```

```
##  [1] "In 278 AC or 279 AC, at Pyke"            
##  [2] "In 273 AC, at Casterly Rock"             
##  [3] "In 268 AC or before, at Pyke"            
##  [4] ""                                        
##  [5] "In 257 AC or before, at Norvos"          
##  [6] "At Hag's Mire"                           
##  [7] "In 219 AC or 220 AC"                     
##  [8] "In 276 AC, at Sunspear"                  
##  [9] "In 284 AC, at Dragonstone"               
## [10] "In 260 AC or before, at King's Landing"  
## [11] "In 289 AC, at Winterfell"                
## [12] "At Old Oak"                              
## [13] "In 275 AC or 276 AC, at Pyke"            
## [14] "In 237 AC"                               
## [15] "At a village Beyond the Wall"            
## [16] "In 290 AC, at Winterfell"                
## [17] "In 280 AC"                               
## [18] "In 264 AC, at Riverrun"                  
## [19] "In 266 AC, at Casterly Rock"             
## [20] "In 263 AC, at Winterfell"                
## [21] "In 266 AC, at Casterly Rock"             
## [22] "In or between 263 AC and 265 AC"         
## [23] "In 283 AC"                               
## [24] "In or between 269 AC and 273 AC, at Pyke"
## [25] "In 244 AC"                               
## [26] "At Unknown"                              
## [27] "In 262 AC"                               
## [28] "In 281 AC, at Sunspear, Dorne"           
## [29] "In 283 AC, at Horn Hill"                 
## [30] "In 286 AC, at Winterfell"
```

```r
map2(nms, birth, function(x, y) paste(x, "was born", y))
```

```
## [[1]]
## [1] "Theon Greyjoy was born In 278 AC or 279 AC, at Pyke"
## 
## [[2]]
## [1] "Tyrion Lannister was born In 273 AC, at Casterly Rock"
## 
## [[3]]
## [1] "Victarion Greyjoy was born In 268 AC or before, at Pyke"
## 
## [[4]]
## [1] "Will was born "
## 
## [[5]]
## [1] "Areo Hotah was born In 257 AC or before, at Norvos"
## 
## [[6]]
## [1] "Chett was born At Hag's Mire"
## 
## [[7]]
## [1] "Cressen was born In 219 AC or 220 AC"
## 
## [[8]]
## [1] "Arianne Martell was born In 276 AC, at Sunspear"
## 
## [[9]]
## [1] "Daenerys Targaryen was born In 284 AC, at Dragonstone"
## 
## [[10]]
## [1] "Davos Seaworth was born In 260 AC or before, at King's Landing"
## 
## [[11]]
## [1] "Arya Stark was born In 289 AC, at Winterfell"
## 
## [[12]]
## [1] "Arys Oakheart was born At Old Oak"
## 
## [[13]]
## [1] "Asha Greyjoy was born In 275 AC or 276 AC, at Pyke"
## 
## [[14]]
## [1] "Barristan Selmy was born In 237 AC"
## 
## [[15]]
## [1] "Varamyr was born At a village Beyond the Wall"
## 
## [[16]]
## [1] "Brandon Stark was born In 290 AC, at Winterfell"
## 
## [[17]]
## [1] "Brienne of Tarth was born In 280 AC"
## 
## [[18]]
## [1] "Catelyn Stark was born In 264 AC, at Riverrun"
## 
## [[19]]
## [1] "Cersei Lannister was born In 266 AC, at Casterly Rock"
## 
## [[20]]
## [1] "Eddard Stark was born In 263 AC, at Winterfell"
## 
## [[21]]
## [1] "Jaime Lannister was born In 266 AC, at Casterly Rock"
## 
## [[22]]
## [1] "Jon Connington was born In or between 263 AC and 265 AC"
## 
## [[23]]
## [1] "Jon Snow was born In 283 AC"
## 
## [[24]]
## [1] "Aeron Greyjoy was born In or between 269 AC and 273 AC, at Pyke"
## 
## [[25]]
## [1] "Kevan Lannister was born In 244 AC"
## 
## [[26]]
## [1] "Melisandre was born At Unknown"
## 
## [[27]]
## [1] "Merrett Frey was born In 262 AC"
## 
## [[28]]
## [1] "Quentyn Martell was born In 281 AC, at Sunspear, Dorne"
## 
## [[29]]
## [1] "Samwell Tarly was born In 283 AC, at Horn Hill"
## 
## [[30]]
## [1] "Sansa Stark was born In 286 AC, at Winterfell"
```

```r
map2(nms, birth, ~ paste(.x, "was born", .y))
```

```
## [[1]]
## [1] "Theon Greyjoy was born In 278 AC or 279 AC, at Pyke"
## 
## [[2]]
## [1] "Tyrion Lannister was born In 273 AC, at Casterly Rock"
## 
## [[3]]
## [1] "Victarion Greyjoy was born In 268 AC or before, at Pyke"
## 
## [[4]]
## [1] "Will was born "
## 
## [[5]]
## [1] "Areo Hotah was born In 257 AC or before, at Norvos"
## 
## [[6]]
## [1] "Chett was born At Hag's Mire"
## 
## [[7]]
## [1] "Cressen was born In 219 AC or 220 AC"
## 
## [[8]]
## [1] "Arianne Martell was born In 276 AC, at Sunspear"
## 
## [[9]]
## [1] "Daenerys Targaryen was born In 284 AC, at Dragonstone"
## 
## [[10]]
## [1] "Davos Seaworth was born In 260 AC or before, at King's Landing"
## 
## [[11]]
## [1] "Arya Stark was born In 289 AC, at Winterfell"
## 
## [[12]]
## [1] "Arys Oakheart was born At Old Oak"
## 
## [[13]]
## [1] "Asha Greyjoy was born In 275 AC or 276 AC, at Pyke"
## 
## [[14]]
## [1] "Barristan Selmy was born In 237 AC"
## 
## [[15]]
## [1] "Varamyr was born At a village Beyond the Wall"
## 
## [[16]]
## [1] "Brandon Stark was born In 290 AC, at Winterfell"
## 
## [[17]]
## [1] "Brienne of Tarth was born In 280 AC"
## 
## [[18]]
## [1] "Catelyn Stark was born In 264 AC, at Riverrun"
## 
## [[19]]
## [1] "Cersei Lannister was born In 266 AC, at Casterly Rock"
## 
## [[20]]
## [1] "Eddard Stark was born In 263 AC, at Winterfell"
## 
## [[21]]
## [1] "Jaime Lannister was born In 266 AC, at Casterly Rock"
## 
## [[22]]
## [1] "Jon Connington was born In or between 263 AC and 265 AC"
## 
## [[23]]
## [1] "Jon Snow was born In 283 AC"
## 
## [[24]]
## [1] "Aeron Greyjoy was born In or between 269 AC and 273 AC, at Pyke"
## 
## [[25]]
## [1] "Kevan Lannister was born In 244 AC"
## 
## [[26]]
## [1] "Melisandre was born At Unknown"
## 
## [[27]]
## [1] "Merrett Frey was born In 262 AC"
## 
## [[28]]
## [1] "Quentyn Martell was born In 281 AC, at Sunspear, Dorne"
## 
## [[29]]
## [1] "Samwell Tarly was born In 283 AC, at Horn Hill"
## 
## [[30]]
## [1] "Sansa Stark was born In 286 AC, at Winterfell"
```

## `pmap()`
`name` has x `aliases` and y `allegiances`


```r
(name <- got_chars %>% map_chr("name"))
```

```
##  [1] "Theon Greyjoy"      "Tyrion Lannister"   "Victarion Greyjoy" 
##  [4] "Will"               "Areo Hotah"         "Chett"             
##  [7] "Cressen"            "Arianne Martell"    "Daenerys Targaryen"
## [10] "Davos Seaworth"     "Arya Stark"         "Arys Oakheart"     
## [13] "Asha Greyjoy"       "Barristan Selmy"    "Varamyr"           
## [16] "Brandon Stark"      "Brienne of Tarth"   "Catelyn Stark"     
## [19] "Cersei Lannister"   "Eddard Stark"       "Jaime Lannister"   
## [22] "Jon Connington"     "Jon Snow"           "Aeron Greyjoy"     
## [25] "Kevan Lannister"    "Melisandre"         "Merrett Frey"      
## [28] "Quentyn Martell"    "Samwell Tarly"      "Sansa Stark"
```

```r
(aliases <- got_chars %>% map("aliases") %>% map_int(., length))
```

```
##  [1]  4 11  1  1  1  1  1  1 11  5 16  1  2  5  3  3  3  5  0  3  4  1  8  2  1
## [26]  5  1  4  7  3
```

```r
(allegiances <- got_chars %>% map("allegiances") %>% map_int(., length))
```

```
##  [1] 1 1 1 0 1 0 0 1 1 2 1 1 2 2 0 1 3 2 1 1 1 2 1 1 1 0 1 1 1 2
```

```r
paste(name, "has", aliases, "aliases and", allegiances, "allegiances")
```

```
##  [1] "Theon Greyjoy has 4 aliases and 1 allegiances"      
##  [2] "Tyrion Lannister has 11 aliases and 1 allegiances"  
##  [3] "Victarion Greyjoy has 1 aliases and 1 allegiances"  
##  [4] "Will has 1 aliases and 0 allegiances"               
##  [5] "Areo Hotah has 1 aliases and 1 allegiances"         
##  [6] "Chett has 1 aliases and 0 allegiances"              
##  [7] "Cressen has 1 aliases and 0 allegiances"            
##  [8] "Arianne Martell has 1 aliases and 1 allegiances"    
##  [9] "Daenerys Targaryen has 11 aliases and 1 allegiances"
## [10] "Davos Seaworth has 5 aliases and 2 allegiances"     
## [11] "Arya Stark has 16 aliases and 1 allegiances"        
## [12] "Arys Oakheart has 1 aliases and 1 allegiances"      
## [13] "Asha Greyjoy has 2 aliases and 2 allegiances"       
## [14] "Barristan Selmy has 5 aliases and 2 allegiances"    
## [15] "Varamyr has 3 aliases and 0 allegiances"            
## [16] "Brandon Stark has 3 aliases and 1 allegiances"      
## [17] "Brienne of Tarth has 3 aliases and 3 allegiances"   
## [18] "Catelyn Stark has 5 aliases and 2 allegiances"      
## [19] "Cersei Lannister has 0 aliases and 1 allegiances"   
## [20] "Eddard Stark has 3 aliases and 1 allegiances"       
## [21] "Jaime Lannister has 4 aliases and 1 allegiances"    
## [22] "Jon Connington has 1 aliases and 2 allegiances"     
## [23] "Jon Snow has 8 aliases and 1 allegiances"           
## [24] "Aeron Greyjoy has 2 aliases and 1 allegiances"      
## [25] "Kevan Lannister has 1 aliases and 1 allegiances"    
## [26] "Melisandre has 5 aliases and 0 allegiances"         
## [27] "Merrett Frey has 1 aliases and 1 allegiances"       
## [28] "Quentyn Martell has 4 aliases and 1 allegiances"    
## [29] "Samwell Tarly has 7 aliases and 1 allegiances"      
## [30] "Sansa Stark has 3 aliases and 2 allegiances"
```



---
author: LY
date: '2022-05-18'

---
