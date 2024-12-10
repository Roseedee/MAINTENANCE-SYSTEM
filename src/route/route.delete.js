const express = require('express');
const route = express.Router();

const Delete = require('../db/Delete')

route.get('/status/:id', async (req, res) => {
    const del = new Delete();
    del.connect();

    const id = req.params.id;

    try {
        const result = await del.Status(id);
    } catch (err) {
        console.error('Error deleting record:', err);
        res.status(500).send('Error deleting data');
    }

    del.disconnect();
    res.redirect('/manage/status-task-manage');
});

route.get('/brand/:id', async (req, res) => {
    const del = new Delete()
    del.connect();

    const id = req.params.id

    try {
        const result = await del.Brand(id)
    }catch (err) {
        console.error('Error deleting record:', err)
        res.status(500).send('Error deleting data');
    }
    
    del.disconnect()
    res.redirect('/manage/brand-task-manage')
})

route.get('/model/:id', async (req, res) => {
    const del = new Delete()
    del.connect()

    const id = req.params.id

    try {
        const result = del.Model(id)
    }catch (err) {
        console.error('Error deleting record:', err)
        res.status(500).send('Error deleting data')
    }

    del.disconnect()
    res.redirect('/manage/model-task-manage')
})

module.exports = route