const { validationResult } = require('express-validator');

const incommingDataResult = (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        const error = new Error('Validation failed.');
        error.statusCode = 422;
        error.data = errors.array();

        return next(error);
    }
    return next();
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