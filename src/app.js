const express = require('express');
const path = require('path');
const route = require('./route/route.js');    //route file

const port = 3000;
const app = express();

app.set ("view engine", "ejs");

//route view
app.use('/' , route)

//route static file
app.use(express.static(path.join(__dirname, "../node_modules/bootstrap/dist/")));  
app.use('/brand', express.static(path.join(__dirname, '../assets/brand'))); //cal /brand/<file name>
app.use('/icons', express.static(path.join(__dirname, '../assets/icons'))); //cal /brand/<file name>
app.use('/users', express.static(path.join(__dirname, '../assets/users'))); //cal /brand/<file name>
app.use('/css', express.static(path.join(__dirname, 'views/css')));
app.use('/js', express.static(path.join(__dirname, 'views/js')));

app.listen(port, () => {
    console.log(`Maintenance System run on port ${port}`)
})