const express = require('express');
const bodyParser = require('body-parser');
require("dotenv").config();
const app = express();

app.use(bodyParser.json());

const userRoutes = require('./routes/userRoutes');
const authRoutes = require('./routes/authRoutes');
const loacationRoutes = require('./routes/locationRoutes');
const carRoutes = require('./routes/carRoutes');
const transactionRoutes = require('./routes/transactionRoutes');

app.use((req,res,next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET, POST, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next()
});
app.use('/auth',authRoutes);
app.use('/users',userRoutes);
app.use('/locations',loacationRoutes);
app.use('/cars',carRoutes);
app.use('/transactions',transactionRoutes);

app.use((error, req,res,next) => {
    const status = error.statusCode || 500;
    const message = error.message;
    const data = error.data;
    res.status(status).json({message: message, data: data})
});
const port =  process.env.PORT;
app.listen(port);