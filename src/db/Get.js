const Database = require('./database')

class Get extends Database {
    Brands(params = []) {
      const sql = 'SELECT * FROM machine_brand'
      return new Promise((resolve, reject) => {
        this.connection.query(sql, params, (error, results) => {
          if (error) {
            return reject(error);
          }
          resolve(results);
        });
      });
    }

    Models(params = []) {
      const sql = 'SELECT * FROM machine_model'
      return new Promise((resolve, reject) => {
        this.connection.query(sql, params, (error, results) => {
          if (error) {
            return reject(error);
          }
          resolve(results);
        });
      });
    }

    Status(params = []) {
      const sql = 'SELECT * FROM status'
      return new Promise((resolve, reject) => {
        this.connection.query(sql, params, (error, results) => {
          if(error) {
            return reject(error)
          }
          resolve(results)
        })
      })
    }
}

module.exports = Get