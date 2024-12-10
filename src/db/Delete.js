const Database = require('./database')

class Delete extends Database {
    Status(id) {
        const sql = "DELETE FROM status WHERE status_id = ?"; 

        return new Promise((resolve, reject) => {
            this.connection.query(sql, id, (error, results) => {
                if (error) {
                    return reject(error);
                }
                resolve({ 
                    id: id
                });
            });
        });
    }

    Brand(id) {
        const sql = "DELETE FROM machine_brand WHERE brand_id = ?"; 

        return new Promise((resolve, reject) => {
            this.connection.query(sql, id, (error, results) => {
                if (error) {
                    return reject(error);
                }
                resolve({ 
                    id: id
                });
            });
        });
    }
}

module.exports = Delete