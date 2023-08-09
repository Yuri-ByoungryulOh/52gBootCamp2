var AWS = require('aws-sdk');
AWS.config.region = 'ap-northeast-2';
var s3 = new AWS.S3();

var params = {
  Bucket: 'lifecoding-test', /* required */
}
s3.listObjects(params).on('success', function handlePage(response){
//	console.log(response.data.Contents);
	for(var name in response.data.Contents){
		console.log(response.data.Contents[name].Key);
	}
	/*
	if (response.hasNextPage()){
		response.nextPage().on('success', handlePage).send();
	}
	*/
}).send();
