const express = require('express');
const router = express.Router();

const authChain = require('../middleware/auth/auth-chain');
const transactionController = require('../controller/transactionController');
const carDataValidateMiddleware = require('../middleware/car/carDataValidateMiddleware');
const validateAllowedFields = require('../middleware/validateAllowedFields');


const insertFields = ["transaction_name","cars_idcar"];

router.get('/transactions',authChain,transactionController.getAllTransactions);
router.post('/rent',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertRentTransaction)
router.post('/rentback',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertRentBackTransaction)
router.post('/sell',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertSoldTransaction)
router.post('/buyback',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertBuyBackTransaction)
router.post('/inservice',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertInserviceTransaction)
router.post('/serviceback',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertServiceBackTransaction)
router.post('/suspended',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertSuspendedTransaction)
router.post('/activated',authChain,validateAllowedFields(insertFields),carDataValidateMiddleware.checkCarIdByIncommingCarId,transactionController.insertActivatedTransaction)


module.exports = router;