This project shows Rmarkdown(Rmd) examples based on R and Python that can be converted to Google Colab notebooks and published and uploaded to Google Docs. We include pdf and docx versions of the examples as well. 

Each Rmd file can be rendered to all of the following formats if desired: 
1. html
1. pdf 
1. md 
1. ipynb 
1. docx

The ipynb files can be uploaded to google colab once they are created. 

They are created by a command line tool called jupytext. 

Jupytext allows converting from rmarkdown or (regular) markdown to ipynb formats.

Jupyter must be installed as well since it is used to create the R kernel version of the ipynb formats. Also the R kernel of Jupyter is used in the R versions of the ipynb colab formats. This kernel choice works in google colab, though it is not advertised yet.   

To see what the project depends on look at the .gitlab-ci.yml file since that is a recipe to install pre-reqs for this project. Roughly the relevant section is here:

We install jupyter and jupytext to enable the conversions to ipynb format:

```bash
apt-get -y install python3-pip
pip3 install jupyter jupytext
```

Then we need to install the R related packages we need:

```bash
apt-get -y install pandoc
wget -qO- "https://yihui.name/gh/tinytex/tools/install-unx.sh" | sh
Rscript -e "install.packages('rmarkdown')"
```

Then we install the R kernel for jupyter (needed by jupytext to convert):

```bash
Rscript -e "install.packages('IRkernel')"
Rscript -e "IRkernel::installspec()"
```

And we install reticulate to run Python engine in Rmd files:

```bash
Rscript -e "install.packages('reticulate')"
```

And then install matplotlib for graphics in Python Rmds

```bash
pip3 install matplotlib
```


Then from the command line build it this way: 

```bash
make 
```

or from Rstudio choose the "Build All" menu from the Build tab

If you would like to make it so that you can automatically upload the ipynb and docx files to google docs you will have to create a credentials.json file from the googles developer console, and then use that together with google-app.js, which is a node application to upload the ipynb and docx files to google docs. 

I recommend taking a look at this example from google:
[Google Drive API Quickstart](https://developers.google.com/drive/api/v3/quickstart/nodejs)

This is basically the example we started with to create our google-app.js. You will need to create a credentials.json like they do in that example. Then put that in this repository for the google-apps.js app to read to get permission to access your google versions of the colab notebooks.
