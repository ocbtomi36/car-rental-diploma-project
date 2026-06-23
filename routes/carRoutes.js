const express = require('express');
const router = express.Router();
const authChain = require('../middleware/auth/auth-chain');
const carController = require('../controller/carController');
const carValidator = require('../validators/car/carValidator')
const CarDataValidateMiddleware = require('../middleware/car/carDataValidateMiddleware');
const { validateParam } = require('../helper/helper');
const validateAllowedFields = require('../middleware/validateAllowedFields');
const insertUpdateCarDatas = ["vin_number", "car_performance", "engine_size", "licence_plate", "technical_validity", "production_time", "color", "bodytype", "fuel", "manufacturer", "type","location_name"];
const { incommingDataResult } = require('../validators/validationResult');

router.get('/cars',authChain,carController.getAllCars);
router.get('/cars/available',authChain,CarDataValidateMiddleware.setCarStatus('available'),carController.getAllCarsByStatus);
router.get('/cars/rented',authChain,CarDataValidateMiddleware.setCarStatus('rented'),carController.getAllCarsByStatus);
router.get('/cars/inservice',authChain,CarDataValidateMiddleware.setCarStatus('inservice'),carController.getAllCarsByStatus);
router.get('/cars/sold',authChain,CarDataValidateMiddleware.setCarStatus('sold'),carController.getAllCarsByStatus);
router.get('/cars/suspended',authChain,CarDataValidateMiddleware.setCarStatus('suspended'),carController.getAllCarsByStatus);

router.post('/car',authChain,validateAllowedFields(insertUpdateCarDatas),[carValidator],incommingDataResult,CarDataValidateMiddleware.checkLicencePlate,CarDataValidateMiddleware.checkVinNumber,CarDataValidateMiddleware.getLocationId,carController.insertCar)
router.put('/car/:carsId',authChain,validateAllowedFields(insertUpdateCarDatas),[carValidator],incommingDataResult,CarDataValidateMiddleware.getLocationId,CarDataValidateMiddleware.checkCarId,carController.updateCar);
/*
{
  "vin_number": "WVWZZZ1JZXW000001",
  "car_performance": 150,
  "engine_size": 1998,
  "licence_plate": "MAB123",
  "technical_validity": "2027-05-31",
  "production_time": "1990-02-02",
  "color": "red",
  "bodytype": "cabrio",
  "fuel": "benzin",
  "location_name": "New Final Rent Car Office",
  "manufacturer": "BMW",
  "type":"X5"
}








*/
module.exports = router;