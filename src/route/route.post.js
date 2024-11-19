const express = require('express');
const route = express.Router();

const Post = require('../db/Post');

route.post('/status', async (req, res) => {
    const post = new Post();
    post.connect()
    const { status, note, color } = req.body;


    console.log(req.body);
    // console.log('Note:', note);
    // console.log('Color:', color);

    try {
        const result = await post.Status({
            status, 
            note, 
            color
        });

        // res.status(201).json({ success: true, id: result.id, message: 'Status added successfully' });
    }catch (err) {
        console.error(err);
        res.status(500).send('Error fetching data');
    }
    post.disconnect()
    res.redirect('/manage/status-task-manage')

})

module.exports = route