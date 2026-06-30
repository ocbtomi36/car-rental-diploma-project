const Location = require('../../model/location/locationModell');
//const Address = require('../../modell/adress/adressModell')

class LocationDataValidateMiddleware {
/** Location Name and Phone number are unique */

    static async checkLocationName(req,res,next) {
        const { location_name } = req.body;
        try {
            const getLocation = await Location.getLocationByLocationName(location_name);
            if(getLocation !== null){
                const error = new Error('Location must be unique');
                error.statusCode = 409;
                return next(error)
            }
            next();
        } catch (error) {
           return next(error)
        }
    }

    static async getLocationIdByLocationName(req,res,next) {
        const { location_name } = req.body;
        try {
            const getLocation = await Location.getLocationByLocationName(location_name);
            if(getLocation === null) {
                const error = new Error('There is no Location with that name');
                error.statusCode = 404;
                return next(error)
            }   
            req.idLocation = getLocation.idlocation;
            next();
        } catch (error) {
           return next(error)
        }
    }

    static async checkPhoneNumberNumber(req,res,next) {
        const { phone_number } = req.body;
        try {
            const getPhoneNumber = await Location.getPhoneNumByPhoneNum(phone_number);
            if(getPhoneNumber != null){
                const error = new Error('Phone number must be unique');
                error.statusCode = 409;
                return next(error)
            }
            next();
        } catch (error) {
           return next(error)
        }
    }
    static async checkLocationId(req,res,next) {
        const { idlocation } = req.params;
        try {
            const getLocation = await Location.getOneLocationDataById(idlocation);
            if(getLocation === null) {
                const error = new Error('There is no Location with that id');
                error.statusCode = 404;
                return next(error)
            }
            req.location = getLocation;
            next();
        } catch (error) {
           return next(error)
        }
    }
}

module.exports = LocationDataValidateMiddleware;