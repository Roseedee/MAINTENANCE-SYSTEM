const express = require('express');
const route = express.Router();

const Delete = require('../db/Delete')

route.get('/status/:id', async (req, res) => {
    const del = new Delete();
    del.connect();

    const { id } = req.params;

    try {
        const result = await del.Status({ id });
    } catch (err) {
        console.error('Error deleting record:', err);
        res.status(500).send('Error deleting data');
    } finally {
        del.disconnect();
        res.redirect('/manage/status-task-manage');
    }
});

module.exports = route