const { validationResult } = require('express-validator');

const incommingDataResult = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(422).json({
            message: 'Validation failed.',
            errors: errors.array()
        });
    }
    next();
};

function typeNumberValidator(fieldname) {
    return function (req,res,next) {
        const value = req.body[fieldname];
        if(typeof value !== 'number') {
            return res.status(400).json({
                error:  `${fieldname} field must be number`,
            });
        }
        next();
    };
}
module.exports = {
    incommingDataResult,
    typeNumberValidator
};