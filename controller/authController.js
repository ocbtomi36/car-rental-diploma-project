const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken')

const User = require('../model/user/userModell');
const AddressService = require('../service/address/addressService');

/* Add new employee to the database */
exports.signup = async (req, res, next) => {
    try {
        if(req.user_role === 'customer' || req.user_role === 'employee') {
            return res.status(403).json({ message: 'Access denied'})
        }
        const { given_name, family_name, pin_number,phone_number, user_role, email, password,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        const is_employed = "yes";
        console.log(is_employed);
        const hashedPassword = await bcrypt.hash(password,13);
        const fkAddress = await AddressService.insertAddress(locality_name,postal_code,street_name,street_type,house_number);
        const insertingUser = new User(given_name,family_name,pin_number,user_role,email,hashedPassword,is_employed,fkAddress,phone_number);
        await insertingUser.saveEmployee();
        return res.status(201).json({ message: 'Employee is Created' })
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
}
exports.login = async(req,res,next) => {  
    try{
    const loadedUser = req.user;
    const is_employed = req.user.is_employed;
    const secret = process.env.JWT_PASSWORD;
    if(is_employed === 'no') {
       return res.status(401).json({message: "Inactive user cannot log in"})
    }
    const token = jwt.sign({
        email: loadedUser.email,
        iduser: loadedUser.iduser,
    }, secret);
    res.status(200).json({token: token, userId: loadedUser.iduser.toString()})
    } catch(error){
        console.log(error)
        res.status(500).json({message: 'An login error occured'})
    }
}
exports.logout = async (req,res,next) => {
    console.log('To do user logout.')   
}