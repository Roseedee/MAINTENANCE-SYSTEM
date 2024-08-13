const express = require('express');
const route = express.Router();
const path = require('path');

const view_path = path.join(__dirname, 'views');

route.get('/', (req, res) => {
    res.render(view_path)
})

route.get('/search', (req, res) => {
    res.render(path.join(view_path, 'search'))
})

module.exports = route;
