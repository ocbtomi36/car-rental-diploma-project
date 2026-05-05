const Car = require('../../model/car/carModell');
const Location = require('../../model/location/locationModell');

class CarDataValidateMiddleware {

    static setCarStatus = (status) => (req,res,next) => {

        const allowed = ['available','rented','inservice','sold','suspended'];

                if (!allowed.includes(status)){
                    throw new Error('Invalid status')
                }
        req.status = status;
        next();
    }

    static async checkCarId(req,res,next){
        const { carsId } = req.params;
        const carDb = await Car.getCarById(carsId);
        if(carDb === null) {
            return res.status(409).json({ message: 'there is no car with that id'})
        }
        req.carDb = carDb;
        next();
    }

    static async checkCarIdByIncommingCarId(req,res,next){
        const { cars_idcar } = req.body;
        const carDb = await Car.getCarById(cars_idcar);
        if(carDb === null) {
            return res.status(409).json({ message: 'there is no car with that id'})
        }
        req.carDb = carDb;
        next();
    }


    static async checkVinNumber(req,res,next) {
        const { vin_number } = req.body;
        const getVinNumber = await Car.getCarByVinNumber(vin_number);
        if(getVinNumber !== null){
            return res.status(409).json({ message: 'vin number must be unique'})
        }
        next();
    }
    static async checkLicencePlate(req,res,next) {
        let { licence_plate } = req.body;
        const getLicencePlate = await Car.getCarByLicencePlate(licence_plate);
        if(getLicencePlate !==  null){
            return res.status(409).json({ message: ' licence plate is already exist'})
        }
        next();
    }
    static async getLocationId(req,res,next) {
        const { location_name } = req.body;
        const getLocationObject = await Location.getLocationIdByLocationName(location_name);
        if(getLocationObject === null) {
            return res.status(409).json({ message: 'there is no location with that id'})
        }
        req.idlocation = getLocationObject.idlocation;
        next();
    }


}
module.exports = CarDataValidateMiddleware;