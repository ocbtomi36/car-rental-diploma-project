
const AddressService = require('../../service/address/addressService');
const User = require('../../model/user/userModell');


exports.getAllCustomers = async (req,res,next) => {
    try {
        if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
        }
        const result = await User.getAllCustomerData();
        if(result !== null) {
        res.status(200).json({message: 'Querry success', data: result});
        } else {
            res.status(200).json({message: 'There is no data in database'})
        }
        } catch (error) {
        res.status(500).json({message: error.message})
        }
}
exports.getOneCustomer = (req,res,next) => {
    
    try {
        if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
        }
        const result = req.user;
    if(result !== null) {
        res.status(200).json({message: 'Querry success OK', data: result});
    } else {
        res.status(200).json({message: 'There is no data in database'});
    }
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}
exports.addNewCustomer = async (req, res, next) => {
    try {
        
        if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
        }
        const { given_name, family_name, pin_number, email, password, is_employed,phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        
        if(email !== undefined || password !== undefined || is_employed !== undefined){
            return res.status(409).json({ message: 'Email, Password and Is employed fields may not content any value'});
        }
        const isPinExist = await User.getIdAndPinNumberByPinNumber(pin_number);
        if(isPinExist) {
            return res.status(409).json({ message: 'This pin number already exists.'});
        } 
        const fkAddress = await AddressService.insertAddress(locality_name,postal_code,street_name,street_type,house_number);

        /* To do */
        /* Mivel még nincs kész a Location modell ami az autokölcsönző címét tartalamazza, így még nem ellenőrizhető, hogy ha az a címet adja be a felhasználo
        akkor azt el kell utasítani. */
        
        const insertingUser = new User(given_name,family_name,pin_number,'customer',null,null,null,fkAddress,phone_number);
        
        await insertingUser.saveCustomer();
        return res.status(201).json({ message: 'Customer is Created' })
        
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
}
exports.updateCustomer = async (req,res,next) => {
    try {
        if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
        }
        const { given_name, family_name, pin_number, phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        const { iduser } = req.params;
        const userRole = 'customer';
        const email = null;
        const password = null;
        const is_employed = null;
        const dbCustomerByPinNumber = await User.getIdAndPinNumberByPinNumber(pin_number);
        if(dbCustomerByPinNumber){
            if(dbCustomerByPinNumber.iduser.toString() !== iduser) {
                return res.status(409).json({ message: 'Pin number is already exist in the database'})
            }
        }
        const fkAddress = await AddressService.insertAddress(locality_name,postal_code,street_name,street_type,house_number);
        /* To do */
        /* Mivel még nincs kész a Location modell ami az autokölcsönző címét tartalamazza, így még nem ellenőrizhető, hogy ha az a címet adja be a felhasználo
        akkor azt el kell utasítani. */
        const updatingUser = new User(given_name, family_name,pin_number, userRole, email, password,is_employed, fkAddress, phone_number);
        await updatingUser.updateCustomerData(iduser);
        return res.status(200).json({ message: 'User update success' });
    } catch (error) {
        return res.status(500).json({message: error.message })
    }
}