#'---
#' title: Explore the Lists
#' output:
#'     html_document:
#'       keep_md: TRUE
#'---

#+ message=FALSE
library(tidyverse)
library(repurrrsive) # Examples of Lists and Dataframes

#' expose list exploration in a rendered .Rmd document
#+ eval=FALSE
library(listviewer)
listviewer::jsonedit(got_chars, mode = "view")

#' List `wesanderson`
str(wesanderson)

str(wesanderson, list.len = 3)

#' List `got_chars`
str(got_chars, list.len = 3)

str(got_chars[[1]], list.len = 5)

#' List `gh_users` and `gh_repos`
str(gh_users, list.len = 3)

str(gh_repos, list.len = 3)

#' **Exercises**
str(wesanderson, max.level = 0)

str(wesanderson, max.level = 1)

str(wesanderson, max.level = 2)

str(got_chars, max.level = 0)

str(got_chars, max.level = 1)

str(got_chars, max.level = 2)


