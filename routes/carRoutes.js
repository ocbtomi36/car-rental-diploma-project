const express = require('express');
const router = express.Router();
const authChain = require('../middleware/auth/auth-chain');
const carController = require('../controller/carController');
const carValidator = require('../validators/car/carValidator')
const CarDataValidateMiddleware = require('../middleware/car/carDataValidateMiddleware');
const { validateParam } = require('../helper/helper');
const validateAllowedFields = require('../middleware/validateAllowedFields');
const insertUpdateCarDatas = ["vin_number", "car_performance", "engine_size", "technical_validity", "production_time","licence_plate", "color", "bodytype", "fuel", "manufacturer", "type","location_name"];
const { incommingDataResult } = require('../validators/validationResult');

router.get('/cars',authChain,carController.getAllCars);
router.get('/car/:carsId',authChain,carController.getOneCar);
router.get('/cars/available',authChain,CarDataValidateMiddleware.setCarStatus('available'),carController.getAllCarsByStatus);
router.get('/cars/rented',authChain,CarDataValidateMiddleware.setCarStatus('rented'),carController.getAllCarsByStatus);
router.get('/cars/inservice',authChain,CarDataValidateMiddleware.setCarStatus('inservice'),carController.getAllCarsByStatus);
router.get('/cars/sold',authChain,CarDataValidateMiddleware.setCarStatus('sold'),carController.getAllCarsByStatus);
router.get('/cars/suspended',authChain,CarDataValidateMiddleware.setCarStatus('suspended'),carController.getAllCarsByStatus);

router.post('/car',authChain,validateAllowedFields(insertUpdateCarDatas),[carValidator],incommingDataResult, CarDataValidateMiddleware.validateLicencePlate, CarDataValidateMiddleware.checkLicencePlate,CarDataValidateMiddleware.checkVinNumber,CarDataValidateMiddleware.getLocationId,carController.insertCar)
router.put('/car/:carsId',authChain,validateAllowedFields(insertUpdateCarDatas),[carValidator],incommingDataResult,CarDataValidateMiddleware.validateLicencePlate,CarDataValidateMiddleware.getLocationId,CarDataValidateMiddleware.checkCarId,carController.updateCar);

module.exports = router;