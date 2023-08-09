var express = require('express');
var formidable = require('formidable');
var app = express();
app.get('/s3', function(req, res){
	res.send('Hello S3~!!');
});
app.listen(80, function(){
	console.log('Connected!!');});
app.get('/form', function(req, res){
	var output = `
	<html> 
	<body> 
		<form enctype='multipart/form-data' method='post' action='upload_receiver'>
			<input type='file' name='userfile'/>
			<input type='submit'/>
		</form>
	</body>
	</html>
	`;
	res.send(output);
});

app.post('/upload_receiver', function(req, res){
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files){
		
		var s3 = new AWS.S3();
		var params = {
			Bucket: 'lifecoding-test',
			Key: files.userfile.originalFilename,
			ACL: 'public-read',
			Body: require('fs').createReadStream(files.userfile.filepath),
		};
		s3.upload(params, function(err, data){
			var reulst = '';
			if(err){
				console.log(err);
				result = 'Fail';}
			else{
				console.log(data);
				result = `<img src = '${data.Location}'/>`;}
			res.send(`<html><body>${result} </body> </html>`);
		});
	
		console.log(err, fields, files);
	});
});

var AWS = require('aws-sdk');

