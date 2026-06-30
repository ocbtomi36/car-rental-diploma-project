const LocationModell = require('../model/location/locationModell');
const AddressService = require('../service/address/addressService');

exports.getAllLocation = async (req,res,next) => {
    if(req.user_role === 'customer') {
        const error = new Error('Access denied');
        error.statusCode = 403;
        return next(error);
    }
    try {
        const locations = await LocationModell.getAllLocation();
    if(locations !== null) { 
        res.status(200).json({message: 'Querry success', data: locations});
    } else { 
        res.status(200).json({message: 'There is no data in database'});
     }
    } catch (error) {
        return next(error);
    }
}
exports.getOneLocation = async (req,res,next) => {
    if(req.user_role === 'customer') {
        const error = new Error('Access denied');
        error.statusCode = 403;
        return next(error);
    }
    res.status(200).json({message: 'Querry success', data: req.location});
}

exports.addLocation = async (req,res,next) => {
    if(req.user_role !== 'admin' ) {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    try {
        const { location_name, phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        let fkAddress = await AddressService.insertAddress(locality_name, postal_code, street_name, street_type, house_number);
        const insertLocation = new LocationModell(location_name, phone_number,fkAddress);
        await insertLocation.saveLocation();
        res.status(201).json({ message: 'Location is Created', data: insertLocation });
        } catch (error) {
        return next(error);
    }
}
// to do
exports.updateLocation = async (req,res,next) => {
    if(req.user_role !== 'admin' ) {
        const error = new Error('Access denied');
        error.statusCode = 403;
        return next(error);
    }
    try {
        const { location_name, phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        const { idlocation } = req.params;
        let updateLocationName;
        let updatePhoneNumber;
        const fkAddress = await AddressService.insertAddress(locality_name, postal_code, street_name, street_type, house_number);
        const locationObjByParam = req.location; 
        const locationObjectByLocationName = await LocationModell.getLocationObjByLocationName(location_name);
        if(locationObjectByLocationName !== null) {
            if(locationObjectByLocationName.idlocation !== locationObjByParam.idlocation) {
                const error = new Error('Access denied');
                error.statusCode = 409;
                return next(error);
            }
        }
        updateLocationName = locationObjectByLocationName.location_name;
        const locationObjectByPhoneNumber = await LocationModell.getLocationObjByPhoneNum(phone_number);
        if(locationObjectByPhoneNumber !== null) {
            if(locationObjectByPhoneNumber.idlocation !== locationObjByParam.idlocation) {
                const error = new Error('Access denied');
                error.statusCode = 409;
                return next(error);
            }
        }
        updatePhoneNumber = locationObjectByPhoneNumber.location_name;
        const updateLocation = new LocationModell(updateLocationName,updatePhoneNumber,fkAddress);
        await updateLocation.updateLocation();
        res.status(201).json({ message: 'Location is Updated', data: updateLocation });
    } catch (error) {
        return next(error);
    }
}


