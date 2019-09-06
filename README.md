This project shows Rmarkdown(Rmd) examples based on R and Python that can be converted to Jupyter or Google Colab Notebooks or uploaded to Google Docs. We include html, pdf and docx versions of each example. 

The examples are shown at the pages link for this project:  

[Rmarkdown Colab Google Docs](https://calvinw.gitlab.io/rmarkdown-colab-google-docs/)

Each Rmd file can be rendered to all of the following formats if desired: 
1. html
1. pdf 
1. docx 
1. md 
1. Colab Notebook (ipynb)
1. Jupyter Notebook (ipynb)

R's rmarkdown and knitr packages are used to render the html, pdf, docx and md versions from the corresponding Rmd. Then ipynb versions are created by using [pandoc](https://pandoc.org/) to convert from markdown (md) version to the ipynb. This is possible since recent versions of pandoc can create ipynb from markdown [see example](https://pandoc.org/try/?text=---%0Atitle%3A+%22Calculator%22%0Ajupyter%3A%0A++kernelspec%3A%0A++++display_name%3A+R%0A++++language%3A+R%0A++++name%3A+ir%0A---%0A%23+Lorem+ipsum%0A%0A**Lorem+ipsum**+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Nunc+luctus%0Abibendum+felis+dictum+sodales.%0A%0A%60%60%60+code%0Aa%3C-3%0Ab%3C-4%0Aa%0Ab%0A%60%60%60%0A**Lorem+ipsum**+dolor+sit+amet%2C+consectetur+adipiscing+elit.+Nunc+luctus%0Abibendum+felis+dictum+sodales.%0A%0A%60%60%60+code%0Aplot(runif(20))%0A%60%60%60&from=markdown&to=ipynb).  

Once the ipynb files are committed to a Gitlab (or Github) repo they can then be opened in [Google Colab](https://colab.research.google.com/) or in [Binder](https://mybinder.org/). We display each notebook in the Jupyter notebook viewer and from there they may be opened in Binder if desired.

We currently mirror this repo to a [github repo](https://github.com/calvinw/machine-learning-rmarkdown) since Google Colab, and Binder are able to open ipynb files stored in github repos.

The R kernel of Jupyter is used in the R versions of the ipynb Colab formats. This kernel choice works in Google Colab, though it is not advertised yet.   

To see what the project depends on look at the .gitlab-ci.yml file since that is a recipe to install pre-reqs for this project. Roughly the relevant things to install include for Python python3-pip, matplotlib, then for rendering and for R weneed a recent pandoc, some TeX tools (we use tinytex) and reticulate. 

```bash
  - apt-get update
  - apt-get -y install python3-pip
  - pip3 install matplotlib
  - wget "https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb"
  - dpkg -i pandoc-2.7.3-1-amd64.deb
  - wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh
  - Rscript -e "install.packages('rmarkdown')"
  - Rscript -e "install.packages('reticulate')"
```

Then once you are ready, just run make:

```bash
make 
```

or you can use Rstudio and choose the "Build All" menu from the Build tab. Likely if you just choose "Build All" in RStudio it will complain and make you install all the pre-reqs above as you go along. This is fine, just enter the above in RStudios Terminal window as you go along.

The above should be enough to get the files built. If you would like to investigate uploading the files to Google Colab or Google Drive, or if you would like to run the nodejs server we have in this repo, you have to install nodejs and npm. We don't cover installing these, just google them if you need to). You will then have to run: 

```bash
npm install
```

which uses the package.json file in this directory.

We use a node app called google-upload.js to: 

2. upload the built .docx to Google Drive 

If you would like to make it so that you can automatically upload the docx files to your Google Docs you will have to create a credentials.json file and place it in this directory. Go to the googles developer console, and create one in a similar fashion to this document from google:  

[Google Drive API Quickstart](https://developers.google.com/drive/api/v3/quickstart/nodejs)

This is basically the example we began with that became our google-upload.js. You will need to create a credentials.json like they do in that example. When you run google-upload.js it will upload to your versions of the Google Docs in your google drive.

Before you run the google-upload.js, you should create a Google Doc (.docx version) as well. You can "make a copy" of our google versions of these if you want, they should be viewable (but not editable) by the world [Google Docs folder](https://drive.google.com/open?id=1eBAj6EFbtJpHDTqdA8UTdPzr-asPaSGH)

Then you use your own googleids from your copies and replace the ones in:

2. google-docx-ids.json

Note google-upload.js app does not create any Google Docs for you, just uploads and saves to existing ones after they are rendered by the make process.

For each docx version you can do this:

```bash
node google-upload.js rExample.docx
```
This reads the googleid for the Docs document for rExample from google-docx-ids.json and uploads the rExample.docx to that file into google drive.

When you run this you will ask you to authenticate the app and allow it to access your Google Drive. For this it uses the credentials.json you made above. It creates a token.json as you do this and that will be used on subsequent runs of the tool. This is the same process that the quickstart example from google above uses, so refer to that if you need more info on this process.. 

The files we use in google drive are at this link: 

[Google Docs folder](https://drive.google.com/open?id=1eBAj6EFbtJpHDTqdA8UTdPzr-asPaSGH)

These should be viewable by everyone, so you can take a look.

See the Makefile for additional build details and targets.
