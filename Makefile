SHELL:=/bin/bash
#SOURCES=$(shell find . -name "*.Rmd")
SOURCES = rExample.Rmd pyExample.Rmd

HTML_FILES = $(SOURCES:%.Rmd=%.html)
IPYNB_FILES = $(SOURCES:%.Rmd=%.ipynb)
PDF_FILES = $(SOURCES:%.Rmd=%.pdf)

all : html pdf ipynb
	@echo All files are now up to date

html: $(HTML_FILES)

pdf: $(PDF_FILES)

ipynb: $(IPYNB_FILES)

clean :
	@echo Removing html, pdf, files...	
	rm -f $(HTML_FILES) $(PDF_FILES) $(IPYNB_FILES)
	rm -rf *_files 

%.html : %.Rmd
	@Rscript -e 'library(knitr); library(rmarkdown)' \
	         -e 'render("$<","html_document")'

%.pdf : %.Rmd
	@Rscript -e 'library(knitr); library(rmarkdown)' \
	         -e 'render("$<","pdf_document")'

%.ipynb : %.Rmd
	@Rscript -e 'library(knitr); library(rmarkdown); library(ipynbdocument)' \
		 -e 'render("$<","ipynb_document")'

.PHONY: all clean
