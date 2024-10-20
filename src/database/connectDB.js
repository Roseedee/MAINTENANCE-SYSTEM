const mysql = require('mysql')
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'maintenance_system_db'
})

connection.connect((error) => {
    if(error) {
        console.log('error connecting: ' + error.stack);
        return;
    }
    console.log("Connected as ID: "+ connection.threadId)
});

module.exports = connection

