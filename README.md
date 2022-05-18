# note_purrr_tutorial
Code and personal notes for [purrr_tutorial](https://jennybc.github.io/purrr-tutorial/index.html) by Jenny Bryan

## Overview

```
map(.x, .f, ...)
map(VECTOR_OR_LIST_INPUT, FUNCTION_TO_APPLY, OPTIONAL_OTHER_STUFF)
```

```
map(data, function(x) paste(x, collapse = "|")) 
map(data, paste, collapse = "|")
map(data, ~ paste(.x, collapse = " | "))
```

## Workflow advice
- test the idea on a single element
- drop the *proven, working logic* into `map()`
- when things aren’t working as expected:
    * pull out an example
    * get everything to work on the example
    * check it on another example
    * scale back up again: `map()`
