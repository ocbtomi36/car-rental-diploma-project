const LocationModell = require('../model/location/locationModell');
const AddressService = require('../service/address/addressService');

exports.getAllLocation = async (req,res,next) => {
    if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
    }
    try {
        const locations = await LocationModell.getAllLocation();
    if(locations !== null) { 
        res.status(200).json({message: 'Querry success', data: locations});
    } else { 
        res.status(200).json({message: 'There is no data in database'});
     }
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}
exports.getOneLocation = async (req,res,next) => {
    if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
    }
    const { idlocation } = req.params;
    try {
        LocationModell.getOneLocationDataById(idlocation);
        res.status(200).json({message: 'Querry success', data: req.location});
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}
/* Csak tulajdonos adhat hozzá mert  */
exports.addLocation = async (req,res,next) => {
    if(req.user_role !== 'admin' ) {
            return res.status(403).json({ message: 'Access denied'})
    }
    try {
        const { location_name, phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        let fkAddress = await AddressService.insertAddress(locality_name, postal_code, street_name, street_type, house_number);
        console.log(fkAddress);
        const insertLocation = new LocationModell(location_name, phone_number,fkAddress);
        await insertLocation.saveLocation();
        res.status(201).json({ message: 'Location is Created' });
        console.log(insertLocation);
        } catch (error) {
        res.status(500).json({message: error.message})
    }
}
exports.updateLocation = async (req,res,next) => {
    if(req.user_role !== 'admin' ) {
        return res.status(403).json({ message: 'Access denied'})
    }
    try {
        const { location_name, phone_number,locality_name, postal_code, street_name, street_type, house_number } = req.body;
        const { idlocation } = req.params;
    } catch (error) {
        return res.status(500).json({message: "An error occured"})
    }
}

/*

const getLocationObject = await LocationModell.getLocationById(idlocation);
        const fkAddress = await AddressService.insertAddress(locality_name, postal_code, street_name, street_type, house_number);
        let fkAddressByIncommingId = await LocationModell.getLocationByFkAdderesses(fkAddress);
        if(fkAddressByIncommingId != null) {
            const idLocationByfkAddress = fkAddressByIncommingId.idlocation;
            const idLocationByIncommingId = getLocationObject.idlocation;
            if(idLocationByfkAddress != idLocationByIncommingId){
               return res.status(409).json({message: 'This address is already in use'})
            }
        }
        const dbLocationNameLocationId = await LocationModell.getLocationByLocationName(location_name);
        const dbPhoneNumberLocationId = await LocationModell.getPhoneNumByPhoneNum(phone_number);
        const isLocationNameOk = dbLocationNameLocationId === null || dbLocationNameLocationId.idlocation == idlocation;
        const isPhoneNumberOk = dbPhoneNumberLocationId === null || dbPhoneNumberLocationId.idlocation == idlocation;
        if (!isLocationNameOk && !isPhoneNumberOk) {
            return res.status(401).json({ message: 'Location name or phone number must be unique' });
        }
        const updatingLocation = new LocationModell(location_name,phone_number,fkAddress);
        await updatingLocation.updateLocation(idlocation);
        return res.status(201).json({ message: 'Location update is success' });




*/