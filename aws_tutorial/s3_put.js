var AWS = require('aws-sdk');
AWS.config.region = 'ap-northeast-2';
var fs = require('fs');
var s3 = new AWS.S3();
var params = {
  ACL: 'public-read',
  Body: fs.createReadStream('https://marketplace.canva.com/EAE-xnqWvJk/1/0/1600w/canva-retro-smoke-and-round-light-desktop-wallpapers-JLofAI27pCg.jpg'), 
  Bucket: 'lifecoding-test',
  Key: "pathway.jpg",
  ContentType: 'image/jpg',
 };
s3.upload(params, function(err, data) {
   if (err) console.log(err, err.stack); // an error occurred
   else     console.log(data);           // successful response
   /*
   data = {
    ETag: "\"6805f2cfc46c0f04559748bb039d69ae\"", 
    VersionId: "tpf3zF08nBplQK1XLOefGskR7mGDwcDk"
   }
   */
});
