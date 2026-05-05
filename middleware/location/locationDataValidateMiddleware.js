const Location = require('../../model/location/locationModell');
//const Address = require('../../modell/adress/adressModell')

class LocationDataValidateMiddleware {
/** Location and Phone number are unique, */

    static async checkLocationName(req,res,next) {
        const { location_name } = req.body;
        const getLocation = await Location.getLocationByLocationName(location_name);
        if(getLocation !== null){
            return res.status(409).json({ message: 'Location must be unique'})
        }
        next();
    }

    static async getLocationIdByLocationName(req,res,next) {
        const { location_name } = req.body;
        const getLocation = await Location.getLocationByLocationName(location_name);
        if(getLocation === null) {
            return res.status(409).json({ message: 'There is no Location with that name'})
        }   
        req.idLocation = getLocation.idlocation;
        next();
    }

    static async checkPhoneNumberNumber(req,res,next) {
        const { phone_number } = req.body;
        const getPhoneNumber = await Location.getPhoneNumByPhoneNum(phone_number);
        if(getPhoneNumber != null){
            return res.status(409).json({ message: 'Phone number must be unique'})
        }
        next();
    }
    static async checkLocationId(req,res,next) {
        console.log(req.params['idlocation']);
        const { idlocation } = req.params;
        const getLocation = await Location.getOneLocationDataById(idlocation);
        if(getLocation === null) {
            return res.status(409).json({ message: 'There is no Location with that id'})
        }
        req.location = getLocation;
        next();
    }
}

module.exports = LocationDataValidateMiddleware;