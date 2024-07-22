const express = require('express');
const path = require('path');
const process = require('process')

const port = process.env.PORT;

const app = express();

app.set ("view engine", "ejs");

app.use(express.static(path.join(__dirname, "node_modules/bootstrap/dist/")));
app.use('/brand', express.static(path.join(__dirname, 'assets/brand'))); //cal /brand/<file name>
app.use(express.static(path.join(__dirname, 'css')));

app.get('/', (req, res) => {
    res.render(path.join(__dirname, 'views'));
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})