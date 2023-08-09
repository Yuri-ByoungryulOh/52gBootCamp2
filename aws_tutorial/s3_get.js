var AWS = require('aws-sdk');
AWS.config.region = 'ap-northeast-2';
var s3 = new AWS.S3();

var file = require('fs').createWriteStream("pathway.jpg");
var params = {Bucket: 'lifecoding-test', Key: 'pathway.jpg',};
s3.getObject(params).createReadStream().pipe(file);
