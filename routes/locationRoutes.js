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
/* Visszaadja az összes telephelyet */
router.get('/locations',authChain,locationController.getAllLocation);
/* Elutasítja, ha nincs id */
router.get('/location', (req, res) => {
    return res.status(400).json({ message: 'idlocation is required' });
});
/* Visszaad egy telehphelyet */
router.get('/location/:idlocation',authChain,validateIdParams,locationDataValidateMiddleware.checkLocationId,locationController.getOneLocation);
/* Hozzáad egy új telephelyet Location name ,phone number unique*/
router.post('/location',authChain,validateAllowedFields(insertUpdateLocationFields),[locationValidator, addressValidator],incommingDataResult,locationDataValidateMiddleware.checkLocationName,locationDataValidateMiddleware.checkPhoneNumberNumber,locationController.addLocation);
/* Elutasítja, ha nincs id */
router.post('/location', (req, res) => {
    return res.status(400).json({ message: 'idlocation is required' });
});
/* Módosít egy telephely adatait */
router.post('/location/:idlocation',authChain,validateIdParams,validateAllowedFields(insertUpdateLocationFields),[locationValidator, addressValidator],incommingDataResult,locationController.updateLocation);
module.exports = router