const CarModell = require('../model/car/carModell');
const BodyTypeService = require('../service/car/bodyTypeService');
const ColorService = require('../service/car/colorService');
const FuelService = require('../service/car/fuelService');
const ManufacturerTypeService = require('../service/car/manufacturerTypeService');
const ProductionTimeService = require('../service/car/productionTimeService');

exports.getAllCars = async (req,res,next) => {

    if(req.user_role === 'customer') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    try {
        const cars = await CarModell.getAllCars();
        if( cars !== null) { 
            res.status(200).json({message: 'Querry success', data: cars});
        } else { 
            res.status(200).json({message: 'There is no data in database'});
        }
    } catch (error) {
       return next(error);
    }
}

exports.getOneCar = async (req,res,next) => {
     if(req.user_role === 'customer') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    try {
        const id = req.params.carsId;
        const cars = await CarModell.getOneCar(id);
        if( cars !== null) { 
            res.status(200).json({message: 'Querry success', data: cars});
        } else { 
            res.status(200).json({message: 'There is no data in database'});
        }
    } catch (error) {
       return next(error);
    }
}

exports.getAllCarsByStatus = async (req,res,next) => {

    if(req.user_role === 'customer') {
           const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    try {
        const status = req.status;
        const cars = await CarModell.getAllCarsByStatus(status);
        if( cars !== null) { 
            res.status(200).json({message: 'Querry success', data: cars});
        } else { 
            res.status(200).json({message: 'There is no data in database'});
        }
    } catch (error) {
        return next(error);
    }
}
exports.insertCar = async (req,res,next) => {
    if(req.user_role === 'customer') {
           const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    const { vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time, color, bodytype, fuel, manufacturer, type } = req.body;
    try {
        let validateLicencePlate = licence_plate;
        if(validateLicencePlate === undefined) {
            validateLicencePlate = null;
        }
        const idlocation = req.idlocation;
        const production_time_idproduction_time = await ProductionTimeService.insertProductionTime(production_time);
        const colors_idcolor = await ColorService.insertColor(color);
        const bodytypes_idbodytype = await BodyTypeService.insertBodyType(bodytype);
        const fuels_idfuel = await FuelService.insertFuel(fuel);
        const manufacturer_types_idmanufacturer_types = await ManufacturerTypeService.insertManufacturerType(type,manufacturer);
        const insertCar = new CarModell(vin_number, car_performance, engine_size, validateLicencePlate, technical_validity, production_time_idproduction_time, colors_idcolor, bodytypes_idbodytype, fuels_idfuel,idlocation, manufacturer_types_idmanufacturer_types);
        const id = await insertCar.saveCar();
        return res.status(201).json({ message: "Car inserted successfully", carId: id});
        } catch (error) {
        return next(error);
    }
}
/* Ezt átnézni */
exports.updateCar = async (req,res,next) => {
    
    if(req.user_role === 'customer') {
        const error = new Error('Access denied');
        error.statusCode = 403;
        return next(error);
    }
    
    const { vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time, color, bodytype, fuel, manufacturer, type, idLocation } = req.body;
    const { carsId } = req.params;
    const idlocation = req.idlocation;
    const carObjDb = req.carDb;
    const dbVinNumber = carObjDb.vin_number;
    const validateVinNumber = vin_number;
    try{
        if(dbVinNumber !== validateVinNumber) {
            const getCarObj = await CarModell.getCarByVinNumber(validateVinNumber);
            if(getCarObj.idcar !== null) {
                const error = new Error('Vin Number is already exist');
                error.statusCode = 409;
                return next(error);
            }
        }
        const dbLicencePlate = carObjDb.licence_plate;
        const validateLicencePlate = licence_plate;
        if(validateLicencePlate === undefined) {
            validateLicencePlate = null;
        } else {
            if(dbLicencePlate !== validateLicencePlate){
                const getCarObj = await CarModell.getCarByLicencePlate(validateLicencePlate);
                if(getCarObj.idcar !== null) {
                    const error = new Error('Licence Plate is already exist');
                    error.statusCode = 409;
                    return next(error);
                }
            }
        }
        const production_time_idproduction_time = await ProductionTimeService.insertProductionTime(production_time);
        const manufacturer_types_idmanufacturer_types = await ManufacturerTypeService.insertManufacturerType(type,manufacturer); 
        console.log(manufacturer_types_idmanufacturer_types);
        const colors_idcolor = await ColorService.insertColor(color);
        const bodytypes_idbodytype = await BodyTypeService.insertBodyType(bodytype);
        const fuels_idfuel = await FuelService.insertFuel(fuel);
        const updateCar = new CarModell(validateVinNumber, car_performance, engine_size, validateLicencePlate, technical_validity, production_time_idproduction_time, colors_idcolor, bodytypes_idbodytype, fuels_idfuel,idlocation, manufacturer_types_idmanufacturer_types);
        await updateCar.updateCar(carsId);
        return res.status(201).json({ message: "Car updated successfully"});
       
    } catch (error) {
        return next(error);
    }
}


/*
        
        
        
        

*/
   