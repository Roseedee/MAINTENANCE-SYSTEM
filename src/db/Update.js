const Database = require('./database')

class Update extends Database {
    Status(id, data) {
        const sql = "Update status SET status=?, status_note=?, status_color=? WHERE status_id=?"
        return new Promise((resolve, reject) => {
            this.connection.query(sql, [
                data.status,
                data.note,
                data.color,
                id
            ], (error, results) => {
                if(error) {
                    return reject(error)
                }

                resolve({ affectedRows: results.affectedRows })
            })
        })
    }

    Model(id, data) {
        const sql = "Update machine_model SET model=? WHERE model_id=?"
        return new Promise((resolve, reject) => {
            this.connection.query(sql, [
                data.model,
                id
            ], (error, results) => {
                if(error) {
                    return reject(error)
                }

                resolve({ affectedRows: results.affectedRows })
            })
        })
    }
}

module.exports = Update