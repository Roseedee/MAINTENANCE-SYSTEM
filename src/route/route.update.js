const express = require('express');
const route = express.Router();

const Update = require('../db/Update');

route.post('/status/:id', async (req, res) => {
    const update = new Update()
    update.connect()

    const id = req.params.id
    const { status, note, color } = req.body

    // console.log(id, {status, note, color})

    try {
        let result = await update.Status(id, {status, note, color})
    }catch (err) {
        console.error('Error Update record:', err);
        res.status(500).send('Error Update data');
    }

    update.disconnect()
    res.redirect('/manage/status-task-manage');
})

module.exports = route