const Database = require('./database')

class Delete extends Database {
    Status(data) {
        // Correct the SQL syntax
        const sql = "DELETE FROM status WHERE status_id = ?"; 

        return new Promise((resolve, reject) => {
            this.connection.query(sql, [data.id], (error, results) => {
                if (error) {
                    return reject(error); // Reject the promise with the error
                }

                // Resolve the promise with a meaningful response
                resolve({ 
                    affectedRows: results.affectedRows, // Number of rows deleted
                    id: data.id // The ID of the deleted record
                });
            });
        });
    }
}

module.exports = Delete