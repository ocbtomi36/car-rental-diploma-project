const { body } = require('express-validator');

    const locationJsonValidate = [
        body('location_name').trim().isLength({min:1,max:30}).withMessage('length of location name is incorrect'),
        body('phone_number').trim().isLength({min:10,max:12}).withMessage('length of phone number is incorrect'),
        body('phone_number').trim().matches(/^(?:\+36|06)(\d{1,2})(\d{6,7})$/).withMessage('incorrect hungarian phone number format!')
    ];

module.exports = locationJsonValidate;