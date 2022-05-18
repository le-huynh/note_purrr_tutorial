---
output:
    html_document:
      keep_md: TRUE
---


```r
library(tidyverse)
library(repurrrsive)
```

### Explore `gh_users`


```r
str(gh_users, max.level = 1)
```

```
## List of 6
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
```

```r
gh_users[[1]] %>% names()
```

```
##  [1] "login"               "id"                  "avatar_url"         
##  [4] "gravatar_id"         "url"                 "html_url"           
##  [7] "followers_url"       "following_url"       "gists_url"          
## [10] "starred_url"         "subscriptions_url"   "organizations_url"  
## [13] "repos_url"           "events_url"          "received_events_url"
## [16] "type"                "site_admin"          "name"               
## [19] "company"             "blog"                "location"           
## [22] "email"               "hireable"            "bio"                
## [25] "public_repos"        "public_gists"        "followers"          
## [28] "following"           "created_at"          "updated_at"
```

```r
gh_users[[1]] %>% str()
```

```
## List of 30
##  $ login              : chr "gaborcsardi"
##  $ id                 : int 660288
##  $ avatar_url         : chr "https://avatars.githubusercontent.com/u/660288?v=3"
##  $ gravatar_id        : chr ""
##  $ url                : chr "https://api.github.com/users/gaborcsardi"
##  $ html_url           : chr "https://github.com/gaborcsardi"
##  $ followers_url      : chr "https://api.github.com/users/gaborcsardi/followers"
##  $ following_url      : chr "https://api.github.com/users/gaborcsardi/following{/other_user}"
##  $ gists_url          : chr "https://api.github.com/users/gaborcsardi/gists{/gist_id}"
##  $ starred_url        : chr "https://api.github.com/users/gaborcsardi/starred{/owner}{/repo}"
##  $ subscriptions_url  : chr "https://api.github.com/users/gaborcsardi/subscriptions"
##  $ organizations_url  : chr "https://api.github.com/users/gaborcsardi/orgs"
##  $ repos_url          : chr "https://api.github.com/users/gaborcsardi/repos"
##  $ events_url         : chr "https://api.github.com/users/gaborcsardi/events{/privacy}"
##  $ received_events_url: chr "https://api.github.com/users/gaborcsardi/received_events"
##  $ type               : chr "User"
##  $ site_admin         : logi FALSE
##  $ name               : chr "Gábor Csárdi"
##  $ company            : chr "Mango Solutions, @MangoTheCat "
##  $ blog               : chr "http://gaborcsardi.org"
##  $ location           : chr "Chippenham, UK"
##  $ email              : chr "csardi.gabor@gmail.com"
##  $ hireable           : NULL
##  $ bio                : NULL
##  $ public_repos       : int 52
##  $ public_gists       : int 6
##  $ followers          : int 303
##  $ following          : int 22
##  $ created_at         : chr "2011-03-09T17:29:25Z"
##  $ updated_at         : chr "2016-10-11T11:05:06Z"
```

Inspect elements 1, 2, 6, 18, 21, and 24 for the 5th GitHub user. 
One of these should be the URL for the user’s profile on GitHub.com. 


```r
gh_users[[5]][c(1, 2, 6, 18, 21, 24)]
```

```
## $login
## [1] "leeper"
## 
## $id
## [1] 3505428
## 
## $html_url
## [1] "https://github.com/leeper"
## 
## $name
## [1] "Thomas J. Leeper"
## 
## $location
## [1] "London, United Kingdom"
## 
## $bio
## [1] "Political scientist and R hacker. Interested in open science, public opinion research, surveys, experiments, crowdsourcing, and cloud computing."
```

Pull out the element that holds the user’s name


```r
gh_users %>% map("login")
```

```
## [[1]]
## [1] "gaborcsardi"
## 
## [[2]]
## [1] "jennybc"
## 
## [[3]]
## [1] "jtleek"
## 
## [[4]]
## [1] "juliasilge"
## 
## [[5]]
## [1] "leeper"
## 
## [[6]]
## [1] "masalmon"
```

```r
gh_users %>% map_chr("login")
```

```
## [1] "gaborcsardi" "jennybc"     "jtleek"      "juliasilge"  "leeper"     
## [6] "masalmon"
```

```r
gh_users %>% map_dfr(`[`, c("login", "name"))
```

```
## # A tibble: 6 x 2
##   login       name                  
##   <chr>       <chr>                 
## 1 gaborcsardi Gábor Csárdi          
## 2 jennybc     Jennifer (Jenny) Bryan
## 3 jtleek      Jeff L.               
## 4 juliasilge  Julia Silge           
## 5 leeper      Thomas J. Leeper      
## 6 masalmon    Maëlle Salmon
```

Use a type-specific form of map() and an extraction shortcut to 
extract the ids of these 6 users


```r
gh_users %>% map_int("id")
```

```
## [1]   660288   599454  1571674 12505835  3505428  8360597
```

Use your list inspection strategies to find the list element that is logical.


```r
gh_users[[1]] %>% map(is.logical)
```

```
## $login
## [1] FALSE
## 
## $id
## [1] FALSE
## 
## $avatar_url
## [1] FALSE
## 
## $gravatar_id
## [1] FALSE
## 
## $url
## [1] FALSE
## 
## $html_url
## [1] FALSE
## 
## $followers_url
## [1] FALSE
## 
## $following_url
## [1] FALSE
## 
## $gists_url
## [1] FALSE
## 
## $starred_url
## [1] FALSE
## 
## $subscriptions_url
## [1] FALSE
## 
## $organizations_url
## [1] FALSE
## 
## $repos_url
## [1] FALSE
## 
## $events_url
## [1] FALSE
## 
## $received_events_url
## [1] FALSE
## 
## $type
## [1] FALSE
## 
## $site_admin
## [1] TRUE
## 
## $name
## [1] FALSE
## 
## $company
## [1] FALSE
## 
## $blog
## [1] FALSE
## 
## $location
## [1] FALSE
## 
## $email
## [1] FALSE
## 
## $hireable
## [1] FALSE
## 
## $bio
## [1] FALSE
## 
## $public_repos
## [1] FALSE
## 
## $public_gists
## [1] FALSE
## 
## $followers
## [1] FALSE
## 
## $following
## [1] FALSE
## 
## $created_at
## [1] FALSE
## 
## $updated_at
## [1] FALSE
```

Use a type-specific form of map() and an extraction shortcut to 
extract this for all 6 users


```r
gh_users %>% map_lgl("site_admin")
```

```
## [1] FALSE FALSE FALSE FALSE FALSE FALSE
```

Find elements other than id that are numbers. Practice extracting them.


```r
gh_users[[1]] %>% map(is.numeric)
```

```
## $login
## [1] FALSE
## 
## $id
## [1] TRUE
## 
## $avatar_url
## [1] FALSE
## 
## $gravatar_id
## [1] FALSE
## 
## $url
## [1] FALSE
## 
## $html_url
## [1] FALSE
## 
## $followers_url
## [1] FALSE
## 
## $following_url
## [1] FALSE
## 
## $gists_url
## [1] FALSE
## 
## $starred_url
## [1] FALSE
## 
## $subscriptions_url
## [1] FALSE
## 
## $organizations_url
## [1] FALSE
## 
## $repos_url
## [1] FALSE
## 
## $events_url
## [1] FALSE
## 
## $received_events_url
## [1] FALSE
## 
## $type
## [1] FALSE
## 
## $site_admin
## [1] FALSE
## 
## $name
## [1] FALSE
## 
## $company
## [1] FALSE
## 
## $blog
## [1] FALSE
## 
## $location
## [1] FALSE
## 
## $email
## [1] FALSE
## 
## $hireable
## [1] FALSE
## 
## $bio
## [1] FALSE
## 
## $public_repos
## [1] TRUE
## 
## $public_gists
## [1] TRUE
## 
## $followers
## [1] TRUE
## 
## $following
## [1] TRUE
## 
## $created_at
## [1] FALSE
## 
## $updated_at
## [1] FALSE
```

```r
gh_users %>% map_dfr(`[`, c("id", "public_repos", "public_gists",
		        "followers", "following"))
```

```
## # A tibble: 6 x 5
##         id public_repos public_gists followers following
##      <int>        <int>        <int>     <int>     <int>
## 1   660288           52            6       303        22
## 2   599454          168           54       780        34
## 3  1571674           67           12      3958         6
## 4 12505835           26            4       115        10
## 5  3505428           99           46       213       230
## 6  8360597           31            0        34        38
```

Use map_dfr() to create a data frame with one row per user and 
variables for “name”, “following”, and “created_at”


```r
gh_users %>% map_dfr(`[`, c("name", "following", "created_at"))
```

```
## # A tibble: 6 x 3
##   name                   following created_at          
##   <chr>                      <int> <chr>               
## 1 Gábor Csárdi                  22 2011-03-09T17:29:25Z
## 2 Jennifer (Jenny) Bryan        34 2011-02-03T22:37:41Z
## 3 Jeff L.                        6 2012-03-24T18:16:43Z
## 4 Julia Silge                   10 2015-05-19T02:51:23Z
## 5 Thomas J. Leeper             230 2013-02-07T21:07:00Z
## 6 Maëlle Salmon                 38 2014-08-05T08:10:04Z
```

### Explore `gh_repos`


```r
gh_repos %>% str(max.level = 1)
```

```
## List of 6
##  $ :List of 30
##  $ :List of 30
##  $ :List of 30
##  $ :List of 26
##  $ :List of 30
##  $ :List of 30
```

```r
gh_repos[[1]] %>% str(max.level = 1)
```

```
## List of 30
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
##  $ :List of 68
```

```r
gh_repos[[1]][[1]] %>% names()
```

```
##  [1] "id"                "name"              "full_name"        
##  [4] "owner"             "private"           "html_url"         
##  [7] "description"       "fork"              "url"              
## [10] "forks_url"         "keys_url"          "collaborators_url"
## [13] "teams_url"         "hooks_url"         "issue_events_url" 
## [16] "events_url"        "assignees_url"     "branches_url"     
## [19] "tags_url"          "blobs_url"         "git_tags_url"     
## [22] "git_refs_url"      "trees_url"         "statuses_url"     
## [25] "languages_url"     "stargazers_url"    "contributors_url" 
## [28] "subscribers_url"   "subscription_url"  "commits_url"      
## [31] "git_commits_url"   "comments_url"      "issue_comment_url"
## [34] "contents_url"      "compare_url"       "merges_url"       
## [37] "archive_url"       "downloads_url"     "issues_url"       
## [40] "pulls_url"         "milestones_url"    "notifications_url"
## [43] "labels_url"        "releases_url"      "deployments_url"  
## [46] "created_at"        "updated_at"        "pushed_at"        
## [49] "git_url"           "ssh_url"           "clone_url"        
## [52] "svn_url"           "homepage"          "size"             
## [55] "stargazers_count"  "watchers_count"    "language"         
## [58] "has_issues"        "has_downloads"     "has_wiki"         
## [61] "has_pages"         "forks_count"       "mirror_url"       
## [64] "open_issues_count" "forks"             "open_issues"      
## [67] "watchers"          "default_branch"
```

extracts the first repo for each user and, within that, 
the 3rd piece of information for the repo


```r
gh_repos %>% map_chr(c(1, 3))
```

```
## [1] "gaborcsardi/after"   "jennybc/2013-11_sfu" "jtleek/advdatasci"  
## [4] "juliasilge/2016-14"  "leeper/ampolcourse"  "masalmon/aqi_pdf"
```

## Mission: 
Get a data frame with one row per repository, 
with variables identifying which GitHub user owns it, the repository name, etc.
### Step 1: Put `gh_repos` into a data frame, along with GitHub usernames 


```r
(owners <- gh_repos %>% map_chr(c(1, 4, 1)))
```

```
## [1] "gaborcsardi" "jennybc"     "jtleek"      "juliasilge"  "leeper"     
## [6] "masalmon"
```

```r
udf <- gh_repos %>%
	set_names(owners) %>%
	enframe("username", "gh_repos")
udf
```

```
## # A tibble: 6 x 2
##   username    gh_repos   
##   <chr>       <list>     
## 1 gaborcsardi <list [30]>
## 2 jennybc     <list [30]>
## 3 jtleek      <list [30]>
## 4 juliasilge  <list [26]>
## 5 leeper      <list [30]>
## 6 masalmon    <list [30]>
```

```r
udf %>% mutate(n_repos = map_int(gh_repos, length))
```

```
## # A tibble: 6 x 3
##   username    gh_repos    n_repos
##   <chr>       <list>        <int>
## 1 gaborcsardi <list [30]>      30
## 2 jennybc     <list [30]>      30
## 3 jtleek      <list [30]>      30
## 4 juliasilge  <list [26]>      26
## 5 leeper      <list [30]>      30
## 6 masalmon    <list [30]>      30
```

1 user


```r
# one_user is a list of repos for one user
one_user <- udf$gh_repos[[1]]
# one_repo is a list of info for one repo of one_user
one_repo <- one_user[[1]]

str(one_repo, max.level = 1, list.len = 6)
```

```
## List of 68
##  $ id               : int 61160198
##  $ name             : chr "after"
##  $ full_name        : chr "gaborcsardi/after"
##  $ owner            :List of 17
##  $ private          : logi FALSE
##  $ html_url         : chr "https://github.com/gaborcsardi/after"
##   [list output truncated]
```

```r
# a selective list of tibble-worthy info for one repo
one_repo[c("name", "private", "open_issues")]
```

```
## $name
## [1] "after"
## 
## $private
## [1] FALSE
## 
## $open_issues
## [1] 0
```

```r
one_user %>% map_df(`[`, c("name", "private", "open_issues"))
```

```
## # A tibble: 30 x 3
##    name        private open_issues
##    <chr>       <lgl>         <int>
##  1 after       FALSE             0
##  2 argufy      FALSE             6
##  3 ask         FALSE             4
##  4 baseimports FALSE             0
##  5 citest      FALSE             0
##  6 clisymbols  FALSE             0
##  7 cmaker      FALSE             0
##  8 cmark       FALSE             0
##  9 conditions  FALSE             0
## 10 crayon      FALSE             7
## # ... with 20 more rows
```

scale up to all users


```r
udf %>% mutate(repo_info = gh_repos %>%
	     	map(. %>% map_df(`[`, c("name", "private", "open_issues"))))
```

```
## # A tibble: 6 x 3
##   username    gh_repos    repo_info        
##   <chr>       <list>      <list>           
## 1 gaborcsardi <list [30]> <tibble [30 x 3]>
## 2 jennybc     <list [30]> <tibble [30 x 3]>
## 3 jtleek      <list [30]> <tibble [30 x 3]>
## 4 juliasilge  <list [26]> <tibble [26 x 3]>
## 5 leeper      <list [30]> <tibble [30 x 3]>
## 6 masalmon    <list [30]> <tibble [30 x 3]>
```

```r
udf %>% mutate(repo_info = gh_repos %>%
	     	map(. %>% map_df(`[`, c("name", "private", "open_issues")))) %>%
	tidyr::unnest(repo_info)
```

```
## # A tibble: 176 x 5
##    username    gh_repos    name        private open_issues
##    <chr>       <list>      <chr>       <lgl>         <int>
##  1 gaborcsardi <list [30]> after       FALSE             0
##  2 gaborcsardi <list [30]> argufy      FALSE             6
##  3 gaborcsardi <list [30]> ask         FALSE             4
##  4 gaborcsardi <list [30]> baseimports FALSE             0
##  5 gaborcsardi <list [30]> citest      FALSE             0
##  6 gaborcsardi <list [30]> clisymbols  FALSE             0
##  7 gaborcsardi <list [30]> cmaker      FALSE             0
##  8 gaborcsardi <list [30]> cmark       FALSE             0
##  9 gaborcsardi <list [30]> conditions  FALSE             0
## 10 gaborcsardi <list [30]> crayon      FALSE             7
## # ... with 166 more rows
```

```r
rdf <- udf %>% mutate(repo_info = gh_repos %>%
	     	map(. %>% map_df(`[`, c("name", "private", "open_issues")))) %>%
	# Remove the `gh_repos` variable
	select(-gh_repos) %>%
	tidyr::unnest(repo_info)
rdf
```

```
## # A tibble: 176 x 4
##    username    name        private open_issues
##    <chr>       <chr>       <lgl>         <int>
##  1 gaborcsardi after       FALSE             0
##  2 gaborcsardi argufy      FALSE             6
##  3 gaborcsardi ask         FALSE             4
##  4 gaborcsardi baseimports FALSE             0
##  5 gaborcsardi citest      FALSE             0
##  6 gaborcsardi clisymbols  FALSE             0
##  7 gaborcsardi cmaker      FALSE             0
##  8 gaborcsardi cmark       FALSE             0
##  9 gaborcsardi conditions  FALSE             0
## 10 gaborcsardi crayon      FALSE             7
## # ... with 166 more rows
```

show the 3 repos for each user that have the most open issues


```r
rdf %>% group_by(username) %>%
	arrange(username, desc(open_issues)) %>%
	slice(1:3)
```

```
## # A tibble: 18 x 4
## # Groups:   username [6]
##    username    name                     private open_issues
##    <chr>       <chr>                    <lgl>         <int>
##  1 gaborcsardi parr                     FALSE            14
##  2 gaborcsardi gh                       FALSE             8
##  3 gaborcsardi crayon                   FALSE             7
##  4 jennybc     2014-01-27-miami         FALSE             4
##  5 jennybc     bingo                    FALSE             3
##  6 jennybc     candy                    FALSE             2
##  7 jtleek      datasharing              FALSE           399
##  8 jtleek      dataanalysis             FALSE             5
##  9 jtleek      genstats                 FALSE             3
## 10 juliasilge  tidytext                 FALSE             5
## 11 juliasilge  2016-14                  FALSE             0
## 12 juliasilge  choroplethrCaCensusTract FALSE             0
## 13 leeper      crandatapkgs             FALSE            12
## 14 leeper      csvy                     FALSE             2
## 15 leeper      ciplotm                  FALSE             1
## 16 masalmon    cpcb                     FALSE             5
## 17 masalmon    rtimicropem              FALSE             5
## 18 masalmon    laads                    FALSE             4
```



---
title: lesson05_extract_elements_advanced.R
author: LY
date: '2022-05-18'

---
