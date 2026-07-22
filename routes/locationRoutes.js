const express = require('express');

const { incommingDataResult } = require('../validators/validationResult');

const router = express.Router();
const authChain = require('../middleware/auth/auth-chain');
const locationValidator = require('../validators/location/locationValidator');
const addressValidator = require('../validators/address/addressValidator');
const locationDataValidateMiddleware = require('../middleware/location/locationDataValidateMiddleware');
const validateAllowedFields = require('../middleware/validateAllowedFields');
const { validateParam } = require('../helper/helper');

const insertUpdateLocationFields = ["location_name", "phone_number", "locality_name", "postal_code", "street_name", "street_type", "house_number"];
const validateIdParams = validateParam('idlocation');
const locationController = require('../controller/locationController');

router.get('/locations',authChain,locationController.getAllLocation);

router.get('/location/:idlocation',authChain,validateIdParams,locationDataValidateMiddleware.checkLocationId,locationController.getOneLocation);

router.post('/location',authChain,validateAllowedFields(insertUpdateLocationFields),[locationValidator, addressValidator],incommingDataResult,locationDataValidateMiddleware.checkLocationName,locationDataValidateMiddleware.checkPhoneNumberNumber,locationController.addLocation);


router.put('/location/:idlocation',authChain,validateIdParams,validateAllowedFields(insertUpdateLocationFields),[locationValidator, addressValidator],incommingDataResult,locationDataValidateMiddleware.checkLocationId,locationController.updateLocation);
module.exports = router