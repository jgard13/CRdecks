//modulos
const express = require('express');
const dotenv = require('dotenv');
const mysql = require('mysql2');
const path = require('path'); //necesito asignar rutas para mi servidor
const cors = require('cors');
const {config} = require('./config/config');

dotenv.config();
const app = express();
const port = process.env.PORT || 3000;
//middleware para direcciones estaticas
app.use(express.static(path.join(__dirname, '../public')));
app.use(express.static(path.join(__dirname, '../src')));

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: config.dbHost,
    user: config.dbUser,
    password: config.dbPassword,
    database: config.dbName,
    port: config.dbPort,
})

//Defino las rutas de inicio ahora si
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/index.html'));
});
app.get('/cards', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/Cards.html'));
});

app.listen(port,()=>{
    console.log("Puerto == ", port);
});