const { body } = require('express-validator');
    const addressJsonValidate = [
        body('locality_name').trim().isLength({min:1,max:45}).withMessage('length of locality name is incorrect'),
        body('postal_code').trim().isLength({min:4,max:4}).withMessage('length of postal code is incorrect'),
        body('postal_code').matches(/^[0-9]+$/).withMessage('postal code must contains only numbers'),
        body('street_name').trim().isLength({min:1,max:30}).withMessage('length of name of street is incorrect'),
        body('street_type').trim().isLength({min:1,max:45}).withMessage('length of type of street is incorrect'),
        body('house_number').trim().isLength({min:1,max:8}).withMessage("length of house number is incorrect")
    ];

module.exports = addressJsonValidate;