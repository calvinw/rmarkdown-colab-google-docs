This project shows Rmarkdown(Rmd) examples based on R and Python that can be converted to Google Colab notebooks and published and uploaded to Google Docs. We include pdf and docx versions of the examples as well. 

The examples are shown at the pages link for this project:  

[Rmarkdown Colab Google Docs](https://calvinw.gitlab.io/rmarkdown-colab-google-docs/)

Each Rmd file can be rendered to all of the following formats if desired: 
1. html
1. pdf 
1. md 
1. ipynb 
1. docx

The ipynb files can be uploaded and opened in [Google Colab](https://colab.research.google.com/) once they are created. Each one specifies the correct kernel (R or python3) for Colab to use.  

These ipynb files are created by a command line tool called [jupytext](https://github.com/mwouts/jupytext).  

Jupytext allows converting from rmarkdown or (regular) markdown to ipynb formats.

We use `rmarkdown::render` in our Makefile to render the html, pdf, md and docx versions of our files, then `jupytext` to render from md to ipynb.


[Jupyter](https://jupyter.org/) must be installed as well since it is used to create the R kernel version of the ipynb formats. Also the R kernel of Jupyter is used in the R versions of the ipynb Colab formats. This kernel choice works in Google Colab, though it is not advertised yet.   

To see what the project depends on look at the .gitlab-ci.yml file since that is a recipe to install pre-reqs for this project. Roughly the relevant things to install are as follows:

We just show installing these from the command line. If you are in RStudio you can use the Terminal window there. 

Install jupyter and jupytext to enable the conversions to ipynb format:

```bash
apt-get -y install python3-pip
pip3 install jupyter jupytext
```

Install the R related packages we need:

```bash
apt-get -y install pandoc
wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh
Rscript -e "install.packages('rmarkdown')"
```

Install the R kernel for jupyter (needed by jupytext to convert):

```bash
Rscript -e "install.packages('IRkernel')"
Rscript -e "IRkernel::installspec()"
```

Install [reticulate](https://rstudio.github.io/reticulate/) to run Python engine in Rmd files:

```bash
Rscript -e "install.packages('reticulate')"
```

Finally install matplotlib (and any other python packaages) for use in Python Rmds

```bash
pip3 install matplotlib
```

Then from the command line build it this way: 

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

1. upload the built .ipynb to Google Colab (really just Google Drive) 
2. upload the built .docx to Google Drive 

If you would like to make it so that you can automatically upload the ipynb and docx files to your Google Colab and Google Docs you will have to create a credentials.json file and place it in this directory. Go to the googles developer console, and create one in a similar fashion to this document from google:  

[Google Drive API Quickstart](https://developers.google.com/drive/api/v3/quickstart/nodejs)

This is basically the example we began with that became our google-upload.js. You will need to create a credentials.json like they do in that example. When you run google-upload.js it will upload to your versions of the Google Colab notebooks or Google Docs in your google drive.

Before you run the google-upload.js, you should create a Google Colab file for each Rmd you create and also a Google Doc (.docx version) as well. You can "make a copy" of our google versions of these if you want, they should be viewable (but not editable) by the world [Google Colab and Docs folder](https://drive.google.com/open?id=1eBAj6EFbtJpHDTqdA8UTdPzr-asPaSGH)

Then you use your own googleids from your copies and replace the ones in:

1. google-colab-ids.json
2. google-docx-ids.json

Note google-upload.js app does not create any Google Docs for you, just uploads and saves to existing ones after they are rendered by the make process.

Once you have your own versions of the google ids you want to use, you can upload the current built versions of the ipynb like this:

```bash
node google-upload.js rExample.ipynb
```

This reads the googleid for the Colab document for rExample from google-colab-ids.json and uploads the rExample.ipynb to that file in your google drive. 

When you run this you will ask you to authenticate the app and allow it to access your Google Drive. For this it uses the credentials.json you made above. It creates a token.json as you do this and that will be used on subsequent runs of the tool. This is the same process that the quickstart example from google above uses, so refer to that if you need more info on this process.. 

For the docx version you can do this:

```bash
node google-upload.js rExample.docx
```

This reads the googleid for the Docs document for rExample from google-docx-ids.json and uploads the rExample.docx to that file into google drive.

The files we use in google drive are at this link: 

[Google Colab and Docs folder](https://drive.google.com/open?id=1eBAj6EFbtJpHDTqdA8UTdPzr-asPaSGH)

These should be viewable by everyone, so you can take a look.

See the Makefile for additional build details and targets.
