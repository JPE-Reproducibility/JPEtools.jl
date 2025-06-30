# JPE Report Template 

[![Build Status](https://github.com/floswald/JPEtools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/floswald/JPEtools.jl/actions/workflows/CI.yml?query=branch%3Amain)

## Required Tools to use Template

1. Install [Quarto](https://quarto.org/docs/get-started/) to compile the report. 
   1. Quarto works more like latex and less then Word: you need to include all inputs to the document (like pictures) if sharing with others, or those elements will not appear.
   2. Given that *sharing* here works via `git`, you will have to `commit` all the files I need to compile your report.
2. `git` 
3. `VScode`: you should install the [markdown paste](https://marketplace.visualstudio.com/items/?itemName=telesoho.vscode-markdown-paste-image) extension to easily paste screenshots into the `.qmd` file.

## Outline

* clone this repo to a findable location on your computer (maybe `~/JPE-replications`?). Click on the green button "Code"
* If so, you will have `~/JPE-replications/JPE-Authorname-12345678` on your machine. You will work inside this folder.
* In your assignment email, there was a link to a dropox folder. Download and unzip as `replication-package` **into this repository**. That is, your repo should look like this after you downloaded the pacakge:

```
.
├── generated
├── images
├── replication-package
├── src
└── test
```

(notice - the final two folders `src` and `test` are part of my toolbox to pre-process packages and you should not touch those folders)



## Recommended workflow

1. Get VScode
2. install [markdown paste](https://marketplace.visualstudio.com/items/?itemName=telesoho.vscode-markdown-paste-image) extension
3. Go to [https://jpe-reproducibility.github.io/jpereplicators/](https://jpe-reproducibility.github.io/jpereplicators/) for step by step guidance.


