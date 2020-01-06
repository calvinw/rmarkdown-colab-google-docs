SHELL:=/bin/bash
SOURCES=$(shell find . -name "*.Rmd")

HTML_FILES = $(SOURCES:%.Rmd=%.html)
MD_FILES = $(SOURCES:%.Rmd=%.md)
IPYNB_FILES = $(SOURCES:%.Rmd=%.ipynb)
PDF_FILES = $(SOURCES:%.Rmd=%.pdf)

export PATH :=.:/bin:/usr/bin:$(PATH)

all : $(HTML_FILES) $(PDF_FILES) $(IPYNB_FILES) $(MD_FILES)
	@echo All files are now up to date

clean :
	@echo Removing html, md, pdf, files...	
	rm -f $(HTML_FILES) $(PDF_FILES) $(MD_FILES)
	rm -rf *_files 

%.html : %.Rmd
	@Rscript renderRmd.R $< html_document

%.md : %.Rmd
	@Rscript renderRmdToMd.R $<
	@sed -i 's/``` r/``` code/g' $@
	@sed -i 's/``` python/```code/g' $@

%.pdf : %.Rmd
	@Rscript renderRmd.R $< pdf_document

%.ipynb : %.md
	pandoc $< -o $@

.PHONY: all clean
