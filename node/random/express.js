express = require('express');
var app = express.createServer();

app.get('/', function(req, res){
    res.send('Hello World');
});
app.get('/foo', function(req, res){
    res.send('Foo');
});

app.listen(3000);
console.log('Server started on port 3000');
