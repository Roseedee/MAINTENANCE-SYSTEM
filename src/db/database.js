const mysql = require('mysql')
require('dotenv').config()

class Database {
  constructor() {
    this.connection = mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME
    });
  }

  connect() {
    this.connection.connect((error) => {
      if(error) {
        console.log('Error connecting: ' + error.stack);
        return 0;
      }
      console.log('Connected as ID: ' + this.connection.threadId)
      return 1;
    });
  }

  disconnect() {
    this.connection.end((error) => {
        if (error) {
            console.log('Error disconnecting: ' + error.stack);
            return;
        }
        console.log('Disconnected from the database.');
    });
  }

  query(sql, params = []) {
    return new Promise((resolve, reject) => {
      this.connection.query(sql, params, (error, results) => {
        if (error) {
            return reject(error);
        }
        resolve(results);
      });
    });
  }
}

module.exports = Database

