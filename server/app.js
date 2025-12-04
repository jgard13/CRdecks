
const express = require('express');
const dotenv = require('dotenv');
const mysql = require('mysql2');
const path = require('path'); 
const cors = require('cors');
const {config} = require('./config/config');

dotenv.config();
const app = express();
const port = process.env.PORT || 3000;
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

//Primer ruta por fin para registrar usuarios
app.post('/registro', (req, res) => {
    const { username, password } = req.body;
    if (!username||!password) {
        return res.status(400).json({ message: "Faltan datos" });
    }

    const sql = "INSERT INTO users (username, password_hash) VALUES (?, ?)";

    db.query(sql, [username, password], (err, result) => {
        if (err) {
            console.error("Error al insertar: ", err);
            return res.status(500).json({ message: "Error en el servidor" });
        }
        res.json({ message: "Usuario registrado correctamente" });
    });
});

//Ruta login
app.post('/login', (req, res) =>{
    const {username, password} = req.body;
    if (!username||!password) {
        return res.status(400).json({ message: "Faltan datos" });
    }

    const sql = "SELECT * FROM users WHERE username = ? AND password_hash = ?";
    db.query(sql, [username, password], (err, result) => {
        if(err){
            console.error("Error al consultar", err);
            return res.status(500).json({message: "Error en el servidor"});
        }
        if(result.length === 0){
            return res.status(401).json({message: "Usuario o contraseña incorrectos"});
        }
        res.json({message: "Sesion Iniciada"});
    });

 
    
});
app.post('/Cards/GetByID', (req, res) => {
    const { ID } = req.body; 

    console.log(`[GET_BY_ID] Solicitud POST recibida para buscar Carta con ID: ${ID}`);

    if (!ID) {
        console.warn(`[GET_BY_ID] ERROR 400: No se proporcionó el ID.`);
        return res.status(400).json({ message: "Se requiere el ID de la carta." });
    }
    const sql = "SELECT ID, NAME, ELIXIR_COST, RARITY, IMAGE_PATH, HAS_EVOLUTION, EVOLUTION_IMAGE_PATH FROM cards WHERE ID = ?"; 
    
    console.log(`[GET_BY_ID] Ejecutando SQL: ${sql} con valor: ${ID}`);

    db.query(sql, [ID], (err, result) => {
        if(err){
            console.error("[GET_BY_ID] ERROR 500 en DB:", err.message);
            return res.status(500).json({message: "Error en el servidor al consultar la base de datos."});
        }
        if (result.length === 0) {
            console.warn(`[GET_BY_ID] ERROR 404: Carta con ID ${ID} no encontrada.`);
            return res.status(404).json({ message: "Carta no encontrada con ese ID." });
        }  
        const cardData = result[0]; 
        console.log(`[GET_BY_ID] Carta encontrada: ${cardData.NAME} (Costo: ${cardData.ELIXIR_COST}) - Ruta Imagen: ${cardData.IMAGE_PATH}`);
        res.status(200).json({ 
            message: "Datos de la carta recuperados con éxito.",
            card: cardData 
        });
    });
});