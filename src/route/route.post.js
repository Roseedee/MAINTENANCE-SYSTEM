const express = require('express');
const route = express.Router();

const Post = require('../db/Post');

route.post('/status', async (req, res) => {
    const post = new Post();
    post.connect()
    const { status, note, color } = req.body;

    // console.log(req.body);
    // console.log('Note:', note);
    // console.log('Color:', color);

    try {
        const result = await post.Status({status, note, color});
    }catch (err) {
        console.error(err);
        res.status(500).send('Error fetching data');
    }
    post.disconnect();
    res.redirect('/manage/status-task-manage');

})

route.post('/brand', async (req, res) => {
    const post = new Post();
    post.connect();

    const { brand } = req.body;

    // console.log('Brand: ', brand)

    try {
        const result = await post.Brand({brand});
    }catch (err) {
        console.error(err)
        res.status(500).send('Error fetching data');
    }

    post.disconnect();
    res.redirect('/manage/brand-task-manage');
})

route.post('/model', async (req, res) => {
    const post = new Post();
    post.connect();

    const { model } = req.body;

    try {
        const result = post.Model({ model });
    }catch (err) {
        console.error(err);
        res.status(500).send('Error fetching data');
    }

    post.disconnect();
    res.redirect('/manage/model-task-manage');
})

module.exports = route