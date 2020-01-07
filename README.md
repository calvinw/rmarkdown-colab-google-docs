This project shows Rmarkdown(Rmd) examples based on R and Python that can be converted to ipynb files used for Google Colab or Jupyter Notebooks. We include html, pdf, and ipynb versions of each example. 

The examples are shown at the pages link for this project:  

[Rmarkdown Colab Google Docs](https://calvinw.gitlab.io/rmarkdown-colab-google-docs/)

Each Rmd file can be rendered to the following formats if desired: 
1. html
1. pdf 
1. Colab Notebook (ipynb)
1. Jupyter Notebook (ipynb)

R's rmarkdown and knitr packages are used to render the html, pdf, and ipynb from the corresponding Rmd. Then ipynb versions are created by using [pandoc](https://pandoc.org/) to convert from markdown (md) version to the ipynb. This is possible since recent versions of pandoc can create ipynb from markdown [see example](https://pandoc.org/try/?text=---%0Atitle%3A+%22Calculator%22%0Ajupyter%3A%0A++kernelspec%3A%0A++++display_name%3A+R%0A++++language%3A+R%0A++++name%3A+ir%0A---%0A%23+Lorem+ipsum%0A%0A**Lorem+ipsum**+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Nunc+luctus%0Abibendum+felis+dictum+sodales.%0A%0A%60%60%60+code%0Aa%3C-3%0Ab%3C-4%0Aa%0Ab%0A%60%60%60%0A**Lorem+ipsum**+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Nunc+luctus%0Abibendum+felis+dictum+sodales.%0A%0A%60%60%60+code%0Aplot(runif(20))%0A%60%60%60&from=markdown&to=ipynb).  

Once the ipynb files are committed to a Gitlab (or Github) repo they can then be opened in [Google Colab](https://colab.research.google.com/) or in [Binder](https://mybinder.org/). We display each notebook in the Jupyter notebook viewer and from there they may be opened in Binder if desired.

We currently mirror this repo to a [github repo](https://github.com/calvinw/machine-learning-rmarkdown) since Google Colab, and Binder are able to open ipynb files stored in github repos.

The R kernel of Jupyter is used in the R versions of the ipynb Colab formats. This kernel choice works in Google Colab, though it is not advertised yet.   

To see what the project depends on look at the .gitlab-ci.yml file since that is a recipe to install pre-reqs for this project.

## Installation

Install a recent version of pandoc. We used 2.9.1.
You can download a .deb file for pandoc from here:

https://github.com/jgm/pandoc/releases

Then install it from the bash shell:

```bash
$ sudo dpkg -i pandoc-2.9.1-1-amd64.deb
```

From R install knitr, rmarkdown and a LaTeX distribution (if you do not already have one):

```r
> install.packages("knitr")
> install.packages("rmarkdown")
> install.packages("tinytex")
> tinytex::install_tinytex()
```

For python3 development, you will need to install python3:

```bash
$ sudo apt-get install python3 python3-pip
$ sudo apt-get install python3-numpy python3-matplotlib python3-pandas 
$ sudo apt-get install python3-tk
```

Then once you are ready, just run make:

```bash
$ make 
```

or you can use Rstudio and choose the "Build All" menu from the Build tab. Likely if you just choose "Build All" in RStudio it will complain and make you install all the pre-reqs above as you go along. This is fine, just enter the above in RStudios Terminal window as you go along.

See the Makefile for additional build details and targets.
