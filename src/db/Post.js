const Database = require('./database')

class Post extends Database {
    Status(data) {
        const sql = "INSERT INTO status (status, status_note, status_color) VALUES (?, ?, ?)"
        return new Promise((resolve, reject) => {
            this.connection.query(sql, [
                data.status,
                data.note,
                data.color
            ], (error, results) => {
                if(error) {
                    return reject(error)
                }

                resolve({ id: results.insertId })
            })
        })
    }

    Brand(data) {
        const sql = "INSERT INTO machine_brand (brand) VALUES (?)"
        return new Promise((resolve, reject) => {
            this.connection.query(sql, [
                data.brand
            ], (error, results) => {
                if(error) {
                    return reject(error)
                }
                resolve({ id: results.insertId })
            })
        })
    }

    Model(data) {
        const sql = "INSERT INTO machine_model (model) VALUES (?)"
        return new Promise((resolve, reject) => {
            this.connection.query(sql, [
                data.model
            ], (error, results) => {
                if(error) {
                    return reject(error)
                }
                resolve({ id: results.insertId })
            })
        })
    }
}

module.exports = Post