const express = require('express');

const customerController = require('../controller/user/customerController');
const employeeController = require('../controller/user/employeeController');
const authChain = require('../middleware/auth/auth-chain');
const customerJsonValidate = require('../validators/user/customer/customerValidator');
const addressJsonValidate = require('../validators/address/addressValidator');
const { incommingDataResult }= require('../validators/validationResult');
const userDataValidateMiddleware = require('../middleware/user/userDataValidateMiddleware');
const validateAllowedFields = require('../middleware/validateAllowedFields');
const { validateParam } = require('../helper/helper');
const router = express.Router();

const insertUpdateCustomerFields = ["given_name","family_name","pin_number","postal_code","locality_name","street_name","street_type","house_number","phone_number"];
const insertUpdateEmployeeFields = ["given_name","family_name","pin_number","user_role","email","password","postal_code","locality_name","street_name","street_type","house_number","phone_number"];
const validateUserIdParams = validateParam('iduser');
/* Visszaadja az összes vásárlót */
router.get('/customers',authChain, customerController.getAllCustomers);

/* Visszaadja egy vásárló adatat a kapott id-val */
router.get('/customer/:iduser',authChain,validateUserIdParams,userDataValidateMiddleware.checkCustomerId,customerController.getOneCustomer); 
/* Létrehoz egy új vásárlót */
router.post('/customer',authChain,validateAllowedFields(insertUpdateCustomerFields),[customerJsonValidate,addressJsonValidate],incommingDataResult,userDataValidateMiddleware.checkPinNumber, customerController.addNewCustomer);

/* Módosít egy vásárló adatait a kapott id alapján */
router.put('/customer/:iduser',authChain,validateUserIdParams,validateAllowedFields(insertUpdateCustomerFields),[customerJsonValidate,addressJsonValidate],incommingDataResult,userDataValidateMiddleware.checkCustomerId,customerController.updateCustomer); 


/*  Visszaadja az összes dolgozót  csak manager vagy admin */ 
router.get('/employees',authChain, employeeController.getAllemployees);

/* Visszaad egy dolgozót */
router.get('/employee/:iduser',authChain,validateUserIdParams,userDataValidateMiddleware.checkEmployeeId, employeeController.getOneEmployee);

/* Létrehoz egy dolgozót az az auth route-ban van */
/* Modosít egy dolgozó adatait */
router.put('/employee/:iduser',authChain,validateUserIdParams, validateAllowedFields(insertUpdateEmployeeFields),[customerJsonValidate,addressJsonValidate], incommingDataResult ,userDataValidateMiddleware.checkEmployeeId,userDataValidateMiddleware.checkUserRole,employeeController.updateEmployee); 

/* Softdelete an employee */
router.put('/deactivate/:iduser',authChain,validateUserIdParams,userDataValidateMiddleware.checkEmployeeId,employeeController.softDelete);

/* Visszahelyezi állományba a felhasználót */
router.put('/reactivate/:iduser',authChain,validateUserIdParams,userDataValidateMiddleware.checkEmployeeId,employeeController.reActivate);
module.exports = router
