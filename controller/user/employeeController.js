const User = require('../../model/user/userModell');
const AddressService = require('../../service/address/addressService');
const bcrypt = require('bcryptjs');
exports.getAllemployees = async (req,res,next) => {
    try {
        if(req.user_role === 'customer' || req.user_role === 'employee') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
        }
        const result = await User.getAllEmployeeData();
        if(result !== null) {
        res.status(200).json({message: 'Querry success', data: result});
        } else {
        res.status(200).json({message: 'There is no data in database', data: []})
        }
    } catch (error) {
        return next(error);
    }
}

exports.getOneEmployee = async (req,res,next) => {
    if(req.user_role === 'customer' || req.user_role === 'employee') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    const user = req.user;
        if(user !== null) {
            res.status(200).json({message: 'Querry success', data: user});
        } else {
            res.status(200).json({message: 'There is no Employee in database', data: []});
        }
}

exports.updateEmployee = async (req,res,next) => {
    try {
        if(req.user_role === 'customer' || req.user_role === 'employee') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
        }
        const { given_name, family_name, pin_number, user_role ,email, password,phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        const { iduser } = req.params;
        const is_employed = req.user.is_employed;
        const hashedPassword = await bcrypt.hash(password, 13);
        const fkAddress = await AddressService.insertAddress(locality_name,postal_code,street_name,street_type,house_number);
        const dbEmailUserId = await User.getOneEmployeeIdByEmail(email);     
        const dbPinNumberUserId = await User.getOneEmployeeIdByPinNumber(pin_number);
        const isEmailOk = dbEmailUserId === null || dbEmailUserId == iduser;
        const isPinOk   = dbPinNumberUserId === null || dbPinNumberUserId == iduser;
        if (isEmailOk && isPinOk) {
            const updatingUser = new User(given_name, family_name, pin_number, user_role, email,hashedPassword, is_employed,fkAddress, phone_number);
            await updatingUser.updateCustomerData(iduser);
            return res.status(200).json({ message: 'User update success' });
        }
        const error = new Error('email or pin number must be unique');
            error.statusCode = 409;
            return next(error);

    } catch (error) {
        return next(error);
    }
}
exports.softDelete = async (req,res,next) => {
    if(req.user_role === 'customer' || req.user_role === 'employee') {
           const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
        }
    try {
        const { iduser } = req.params;
        const dbIsEmployed = req.user.is_employed;
        if(dbIsEmployed === 'no') {
            const error = new Error('Deactivated user cannot set deacive again');
            error.statusCode = 403;
            return next(error);
        }
        const is_employed = 'no';
        await User.setEmployeeStatus(iduser,is_employed);
        res.status(200).json({ message: 'User deactivated successfully' });
    } catch (error) {
        return next(error)
    }
}

exports.reActivate = async (req,res,next) => {
    if(req.user_role === 'customer' || req.user_role === 'employee') {
        const error = new Error('Access denied');
        error.statusCode = 403;
        return next(error);
    }
    try {
        const { iduser } = req.params;
        const dbIsEmployed = req.user.is_employed;
        if(dbIsEmployed === 'yes') {
        const error = new Error('Active user cannot set active again');
        error.statusCode = 409;
        return next(error);
        }
        const is_employed = 'yes'
        await User.setEmployeeStatus(iduser,is_employed);
        res.status(200).json({ message: 'User activated successfully' });
    } catch (error) {
        return next(error);
    }
}
