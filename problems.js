var fs = require('fs');
var path = require('path');
var dirPath = path.resolve(__dirname); // path to your directory goes here
var filesList;
fs.readdir(dirPath, function(err, files){
  filesList = files.filter(function(e){
    return path.extname(e).toLowerCase() === '.rmd'
  });
    var id = 1;
    var arr = [];
  //console.log(filesList);
    //
    let googleidsdata = fs.readFileSync('google-ids.json');
    let googleids = JSON.parse(googleidsdata);

    for(f of filesList){
      var parsed = path.parse(f);
      var name = parsed.name;

      var htmlFile = name + '.html'
      var rmdFile = name + '.Rmd'
      var pdfFile = name + '.pdf'
      var ipynbFile = name + '.ipynb'
      var googleId = googleids[name]; 

	var item = {
	  id: name,
	  name: name,
	  children: [
	    { id: htmlFile , name: 'html', file: 'html' },
	    { id: rmdFile, name: 'Rmd', file: 'md' },
	    { id: pdfFile, name: 'pdf', file: 'pdf'},
	    { id: ipynbFile, name: 'ipynb', file: 'ipynb', googleId: googleId}
	  ]
	};
	arr.push(item);
	id++;
      //console.log(name);
    }
    console.log(JSON.stringify(arr, null, 2));
});
