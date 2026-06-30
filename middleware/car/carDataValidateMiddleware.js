const Car = require('../../model/car/carModell');
const Location = require('../../model/location/locationModell');

class CarDataValidateMiddleware {

    static setCarStatus = (status) => (req,res,next) => {

        const allowed = ['available','rented','inservice','sold','suspended'];

                if (!allowed.includes(status)){
                    const error = new Error('Invalid status');
                    error.statusCode = 400;
                    return next(error);
                }
            req.status = status;
            next();
        }

    static async checkCarId(req,res,next){
        const { carsId } = req.params;
        const carDb = await Car.getCarById(carsId);
        if(carDb === null) {
            const error = new Error('There is no car with that id');
            error.statusCode = 404;
            return next(error);
        }
        req.carDb = carDb;
        return next();
    }

    static async checkCarIdByIncommingCarId(req,res,next){
        const { cars_idcar } = req.body;
        const carDb = await Car.getCarById(cars_idcar);
        if(carDb === null) {
            const error = new Error('There is no car with that id');
            error.statusCode = 404;
            return next(error);
        }
        req.carDb = carDb;
        return next();
    }


    static async checkVinNumber(req,res,next) {
        const { vin_number } = req.body;
        const getVinNumber = await Car.getCarByVinNumber(vin_number);
        if(getVinNumber !== null){
            const error = new Error('Vin number must be uique');
            error.statusCode = 409;
            return next(error);
        }
        return next();
    }
    static async checkLicencePlate(req,res,next) {
        let { licence_plate } = req.body;
        const getLicencePlate = await Car.getCarByLicencePlate(licence_plate);
        if(getLicencePlate !==  null){
            const error = new Error('Licence plate is already exsist');
            error.statusCode = 409;
            return next(error);
        }
        return next();
    }
    static async getLocationId(req,res,next) {
        const { location_name } = req.body;
        const getLocationObject = await Location.getLocationIdByLocationName(location_name);
        if(getLocationObject === null) {
            const error = new Error('There is no location with that id');
            error.statusCode = 404;
            return next(error);
        }
        req.idlocation = getLocationObject.idlocation;
        return next();
    }


}
module.exports = CarDataValidateMiddleware;