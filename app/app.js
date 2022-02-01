const express = require('express');
const functions = require('./functions')
const app = express();


app.get('/', function (req, res) {
  let result = functions.catString('Hello', 'world', '!')
  res.send(result + ' Daniël was here!');
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
