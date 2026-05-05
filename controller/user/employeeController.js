const User = require('../../model/user/userModell');
const AddressService = require('../../service/address/addressService');
const bcrypt = require('bcryptjs');
exports.getAllemployees = async (req,res,next) => {
    try {
        if(req.user_role === 'customer' || req.user_role === 'employee') {
            return res.status(403).json({ message: 'Access denied'})
        }
        const result = await User.getAllEmployeeData();
        if(result !== null) {
        res.status(200).json({message: 'Querry success', data: result});
        } else {
        res.status(200).json({message: 'There is no data in database'})
        }
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}

exports.getOneEmployee = async (req,res,next) => {
    if(req.user_role === 'customer' || req.user_role === 'employee') {
            return res.status(403).json({ message: 'Access denied'})
    }
    const { iduser } = req.params;
    try {
        const result = await User.getOneEmployeeDataById(iduser);
    if(result !== null) {
        res.status(200).json({message: 'Querry success', data: result});
    } else {
        res.status(200).json({message: 'There is no data in database'});
    }
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}

exports.updateEmployee = async (req,res,next) => {
    try {
        if(req.user_role === 'customer' || req.user_role === 'employee') {
            return res.status(403).json({ message: 'Access denied'})
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
            return res.status(201).json({ message: 'User update success' });
        }
        return res.status(401).json({ message: 'email or pin number must be unique' });

    } catch (error) {
        return res.status(500).json({message: error.message })
    }
}
exports.softDelete = async (req,res,next) => {
    if(req.user_role === 'customer' || req.user_role === 'employee') {
            return res.status(403).json({ message: 'Access denied'})
        }
    try {
        const { iduser } = req.params;
        const dbIsEmployed = req.user.is_employed;
        if(dbIsEmployed === 'no') {
            return res.status(409).json({ message: 'deactivated user cannot set deactive again' });
        }
        const is_employed = 'no';
        await User.setEmployeeStatus(iduser,is_employed);
        res.status(200).json({ message: 'User deactivated successfully' });
    } catch (error) {
        return res.status(500).json({message: error.message});
    }
}

exports.reActivate = async (req,res,next) => {
    if(req.user_role === 'customer' || req.user_role === 'employee') {
            return res.status(403).json({ message: 'Access denied'})
    }
    try {
        const { iduser } = req.params;
        const dbIsEmployed = req.user.is_employed;
        if(dbIsEmployed === 'yes') {
            return res.status(409).json({ message: 'active user cannot set acive again' });
        }
        const is_employed = 'yes'
        await User.setEmployeeStatus(iduser,is_employed);
        res.status(200).json({ message: 'User activated successfully' });
    } catch (error) {
        return res.status(500).json({message: error.message});
    }
}
