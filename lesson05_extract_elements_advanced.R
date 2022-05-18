#'---
#' output:
#'     html_document:
#'       keep_md: TRUE
#'---

#+ message=FALSE
library(tidyverse)
library(repurrrsive)

#' ### Explore `gh_users`
str(gh_users, max.level = 1)

gh_users[[1]] %>% names()

gh_users[[1]] %>% str()

#' Inspect elements 1, 2, 6, 18, 21, and 24 for the 5th GitHub user. 
#' One of these should be the URL for the user’s profile on GitHub.com. 
gh_users[[5]][c(1, 2, 6, 18, 21, 24)]

#' Pull out the element that holds the user’s name
gh_users %>% map("login")

gh_users %>% map_chr("login")

gh_users %>% map_dfr(`[`, c("login", "name"))

#' Use a type-specific form of map() and an extraction shortcut to 
#' extract the ids of these 6 users
gh_users %>% map_int("id")

#' Use your list inspection strategies to find the list element that is logical.
gh_users[[1]] %>% map(is.logical)

#' Use a type-specific form of map() and an extraction shortcut to 
#' extract this for all 6 users
gh_users %>% map_lgl("site_admin")

#' Find elements other than id that are numbers. Practice extracting them.
gh_users[[1]] %>% map(is.numeric)

gh_users %>% map_dfr(`[`, c("id", "public_repos", "public_gists",
		        "followers", "following"))

#' Use map_dfr() to create a data frame with one row per user and 
#' variables for “name”, “following”, and “created_at”
gh_users %>% map_dfr(`[`, c("name", "following", "created_at"))

#' ### Explore `gh_repos`
gh_repos %>% str(max.level = 1)

gh_repos[[1]] %>% str(max.level = 1)

gh_repos[[1]][[1]] %>% names()

#' extracts the first repo for each user and, within that, 
#' the 3rd piece of information for the repo
gh_repos %>% map_chr(c(1, 3))

#' ## Mission: 
#' Get a data frame with one row per repository, 
#' with variables identifying which GitHub user owns it, the repository name, etc.
#' ### Step 1: Put `gh_repos` into a data frame, along with GitHub usernames 
(owners <- gh_repos %>% map_chr(c(1, 4, 1)))

udf <- gh_repos %>%
	set_names(owners) %>%
	enframe("username", "gh_repos")
udf

udf %>% mutate(n_repos = map_int(gh_repos, length))

#' 1 user
# one_user is a list of repos for one user
one_user <- udf$gh_repos[[1]]
# one_repo is a list of info for one repo of one_user
one_repo <- one_user[[1]]

str(one_repo, max.level = 1, list.len = 6)

# a selective list of tibble-worthy info for one repo
one_repo[c("name", "private", "open_issues")]

one_user %>% map_df(`[`, c("name", "private", "open_issues"))

#' scale up to all users
udf %>% mutate(repo_info = gh_repos %>%
	     	map(. %>% map_df(`[`, c("name", "private", "open_issues"))))

udf %>% mutate(repo_info = gh_repos %>%
	     	map(. %>% map_df(`[`, c("name", "private", "open_issues")))) %>%
	tidyr::unnest(repo_info)

rdf <- udf %>% mutate(repo_info = gh_repos %>%
	     	map(. %>% map_df(`[`, c("name", "private", "open_issues")))) %>%
	# Remove the `gh_repos` variable
	select(-gh_repos) %>%
	tidyr::unnest(repo_info)
rdf

#' show the 3 repos for each user that have the most open issues
rdf %>% group_by(username) %>%
	arrange(username, desc(open_issues)) %>%
	slice(1:3)

