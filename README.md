This project shows Rmarkdown(Rmd) examples based on R and Python that can be converted to ipynb files for use in Google Colab or Jupyter Notebooks. 

We include a way to build html, pdf, and ipynb versions of each example Rmd file. 

All the built examples are shown at the pages link for this project:  

[Rmarkdown Colab Google Docs](https://calvinw.gitlab.io/rmarkdown-colab-google-docs/)

Each Rmd file can be rendered as: 
1. html
1. pdf 
1. ipynb (Colab or Jupyter)

R's rmarkdown and knitr packages are used to render the html and pdf versions from the corresponding Rmd. 
The ipynb versions are created by using [pandoc](https://pandoc.org/) to convert from markdown (md) version to the ipynb. This is possible since recent versions of pandoc can create ipynb from markdown [see example](https://pandoc.org/try/?text=---%0Atitle%3A+%22Calculator%22%0Ajupyter%3A%0A++kernelspec%3A%0A++++display_name%3A+R%0A++++language%3A+R%0A++++name%3A+ir%0A---%0A%23+Lorem+ipsum%0A%0A**Lorem+ipsum**+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Nunc+luctus%0Abibendum+felis+dictum+sodales.%0A%0A%60%60%60+code%0Aa%3C-3%0Ab%3C-4%0Aa%0Ab%0A%60%60%60%0A**Lorem+ipsum**+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Nunc+luctus%0Abibendum+felis+dictum+sodales.%0A%0A%60%60%60+code%0Aplot(runif(20))%0A%60%60%60&from=markdown&to=ipynb).  

We use a custom RMarkdown output format called ipynb_format that does the above..
It is described in the package [ipynbdocument](https://gitlab.com/calvinw/ipynbdocument). You need to install this package as follows in R:

```r
> install.packages("remotes")
> library("remotes")
> install_gitlab("calvinw/ipynbdocument")
```

Once the ipynb files are built, they can optionally be committed to a Gitlab (or Github) repo so they can then be opened in [Google Colab](https://colab.research.google.com/) or as a Jupyter notebook for example in [Binder](https://mybinder.org/). 

On the pages site for this repo(see link above), we display each notebook with a Google Colab link and also a link to a Jupyter notebook viewer. From there they may be opened in Binder if desired.

We currently mirror this repo to a [github repo](https://github.com/calvinw/rmarkdown-colab-google-docs) since Google Colab, and Binder are better able to open ipynb files stored in github repos than in gitlab.

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

For python3 development, you need the "reticulate" package for R since that is used by the knitr and rmarkdown engine when rendering.

```r
> install.packages("reticulate")
```

You should also install in the normal way any python packages you need (like numpy, matplotlib). We do not show this here, but it is straightforward.

Finally you can render any Rmd files to the different formats using:

```bash
$ make 
```
or you can use Rstudio and choose the "Build All" menu from the Build tab. Likely if you just choose "Build All" in RStudio it will complain and make you install all the pre-reqs above as you go along. This is fine, just enter the above in RStudios Terminal window as you go along.

See the Makefile for additional build details and targets.

The files requirements.txt and runtime.txt are only used to allow binder to turn the github repo into a container. They are not significant aside from that.
