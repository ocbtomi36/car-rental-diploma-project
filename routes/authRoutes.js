const express = require('express');
const { body } = require('express-validator');
const { incommingDataResult } = require('../validators/validationResult');
const validateAllowedFields = require('../middleware/validateAllowedFields');
const employeeJsonValidate = require('../validators/user/employee/employeeValidator');
const addressJsonValidate = require('../validators/address/addressValidator');
const authController = require('../controller/authController');
const authChain = require('../middleware/auth/auth-chain');
const router = express.Router();
const EmployeeLoginValidateMiddleware = require('../middleware/user/employee/employeeLoginValidateMiddleware');
const userDataValidateMiddleware = require('../middleware/user/userDataValidateMiddleware');

const insertUpdateEmployeeFields = ["given_name","family_name","pin_number","user_role","email","password","postal_code","locality_name","street_name","street_type","house_number","phone_number"];
const login = ["email","password"];
router.post('/signup',authChain,validateAllowedFields(insertUpdateEmployeeFields),[employeeJsonValidate, addressJsonValidate],incommingDataResult,userDataValidateMiddleware.checkEmail,userDataValidateMiddleware.checkPinNumber,userDataValidateMiddleware.checkUserRole,authController.signup); /* A beszurásnál lényeges, hogy a pin number létezik e és az email*/
router.post('/login',[
    body('email').trim().isEmail().normalizeEmail().withMessage("this field must be an valid e-mail format"),
    body('password').trim().isLength({min:1,max:100}).withMessage('length of password is incorrect')
    ], validateAllowedFields(login),incommingDataResult,EmployeeLoginValidateMiddleware.loginUser,authController.login);

module.exports = router;

