const { body } = require('express-validator');

    const customerJsonValidate = [
        body('given_name').trim().isLength({min:1,max:50}).withMessage('length of given name is incorrect'),
        body('family_name').trim().isLength({min:1,max:50}).withMessage('length of family name is incorrect'),
        body('pin_number').trim().isLength({min:8,max:8}).withMessage('length of pin number is incorrect'),
        body('pin_number').matches(/^[A-Z]{2}[0-9]{6}$/).withMessage('Wrong pin number format'),
        body('phone_number').trim().isLength({min:10,max:20}).withMessage('length of phone_number is incorrect'),
        body('phone_number').trim().matches(/^\+?\d+$/).withMessage('phone number format is invalid')
    ];

module.exports = customerJsonValidate;
/** Check if it is not duplicated 

const customerJsonUpdateValidae = [

        body('given_name').trim().isLength({min:1,max:50}).withMessage('length of given name is incorrect'),
        body('family_name').trim().isLength({min:1,max:50}).withMessage('length of family name is incorrect'),
        body('pin_number').trim().isLength({min:8,max:8}).withMessage('length of pin number is incorrect'),
        body('pin_number').matches(/^[A-Z]{2}[0-9]{6}$/).withMessage('Wrong pin number format')
    ]

module.exports = customerJsonUpdateValidae;
*/