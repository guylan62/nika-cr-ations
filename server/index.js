const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql')
const cors = require('cors');

const app = express()
const port = process.env.PORT || 3001

app.use(bodyParser.urlencoded({ extended: false }))

app.use(bodyParser.json())

app.use(cors())

// MySQL
const pool = mysql.createPool({
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'nika_creation'
})

app.post('/create', (req, res) => {
    const name =req.body.name;
    const firstName =req.body.firstName;
    const email =req.body.email;

    pool.query(
        'INSERT INTO user_app (name, firstName, email) VALUES (?,?,?)',
        [name, firstName, email], 
        (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.send('Values Inserted');
            }
        }
    );
});

app.listen(3001, () => {
    console.log("Yey, your server is running on port 3001");
});

app.get('', (req, res) => {

    pool.getConnection((err, connection) => {
        if(err) throw err
        console.log(`connected as id ${connection.threadId}`)

        connection.query('SELECT * from product', (err, rows) => {
            connection.release() // return the connection to pool

            if(!err) {
                res.send(rows)
            } else {
                console.log(err)
            }
        })
    })
})