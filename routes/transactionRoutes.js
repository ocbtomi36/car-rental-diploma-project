const express = require('express');
const router = express.Router();

const authChain = require('../middleware/auth/auth-chain');
const transactionController = require('../controller/transactionController');
const { incommingDataResult }= require('../validators/validationResult');
const userDataValidateMiddleware = require('../middleware/user/userDataValidateMiddleware');
const carDataValidateMiddleware = require('../middleware/car/carDataValidateMiddleware');
const validateAllowedFields = require('../middleware/validateAllowedFields');
const { validateParam } = require('../helper/helper');

const insertFields = ["transaction_name","cars_idcar"];

router.get('/transactions',authChain,transactionController.getAllTransactions);
router.post('/transactions',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertTransaction);




module.exports = router;