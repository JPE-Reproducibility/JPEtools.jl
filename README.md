# JPEtools

[![Build Status](https://github.com/floswald/JPEtools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/floswald/JPEtools.jl/actions/workflows/CI.yml?query=branch%3Amain)


## Template repo for JPE reports

Usage of this repo:

1. this is template for each new paper repo
2. from this template, we create repo by giving `Author-12345678` and `doi`
3. We copy paper and appendix into it at the root
4. We download the package using `doi` from dv (or equivalent location like zenodo) to `/replication-package`
5. Only if DE
   1. run prechecks on package content and create `generated`
   2. assemble md report template
   3. delete `/replication-package`
   4. git commit to repo
   5. push to github
6. Replicator clones from github
7. re-downloads and replaces as  `/replication-package`
8. runs job inside repo, using `template-config.do`

