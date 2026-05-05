const { body } = require('express-validator');

    const carJsonValidate = [
        body('vin_number').trim().isLength({min:17,max:17}).withMessage('length of vin_number is incorrect'),
        body('car_performance').trim().isInt({min:20, max:1200}).withMessage('car performance must be between 20 and 1200'),
        body('licence_plate').trim().toUpperCase().matches(/^([A-Z]{3,4}-?\d{3,4})$/).withMessage('Invalid Hungarian licence plate format'),
        body('engine_size').trim().isInt({min:250,max:10000}).withMessage('engine size must be between 250 and 10000'),
        body('production_time').trim().matches(/^(?:[1-9]{1}[0-9]{3}-[0-9]{2}-[0-9]{2})$/).withMessage('production time field is not date format'),
        body('color').trim().isLength({min:1,max:15}).withMessage('length of color is incorrect'),
        body('bodytype').trim().isLength({min:1,max:15}).withMessage('length of bodytype is incorrect'),
        body('fuel').trim().isLength({min:1,max:15}).withMessage('length of fuel is incorrect'),
        body('location_name').trim().isLength({min:8,max:30}).withMessage('length location_name is incorrect'),
        body('manufacturer').trim().isLength({min:3,max:20}).withMessage('length of vin_number is incorrect'),
        body('type').trim().isLength({min:1,max:20}).withMessage('length of vin_number is incorrect')
    ];
module.exports = carJsonValidate;