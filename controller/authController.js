const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken')

const User = require('../model/user/userModell');
const AddressService = require('../service/address/addressService');


exports.signup = async (req, res, next) => {
    try {
        if(req.user_role === 'customer' || req.user_role === 'employee') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
        }
        const { given_name, family_name, pin_number,phone_number, user_role, email, password,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        const is_employed = "yes";
        const hashedPassword = await bcrypt.hash(password,13);
        const fkAddress = await AddressService.insertAddress(locality_name,postal_code,street_name,street_type,house_number);
        const insertingUser = new User(given_name,family_name,pin_number,user_role,email,hashedPassword,is_employed,fkAddress,phone_number);
        await insertingUser.saveEmployee();
        return res.status(201).json({ message: 'Employee is Created' })
    } catch (error) {
        return next(error);
    }
}
exports.login = async(req,res,next) => {  
    try{
    const loadedUser = req.user;
    const is_employed = req.user.is_employed;
    const secret = process.env.JWT_PASSWORD;
    if(is_employed === 'no') {
        const error = new Error("Inactive user cannot log in");
        error.statusCode = 401;
        return next(error);
    }
    const token = jwt.sign({
        email: loadedUser.email,
        iduser: loadedUser.iduser,
    }, secret);
    res.status(200).json({token: token, userId: loadedUser.iduser.toString()})
    } catch(error){

        return next(error);
    }
}