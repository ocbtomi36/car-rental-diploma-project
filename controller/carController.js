const CarModell = require('../model/car/carModell');
const BodyTypeService = require('../service/car/bodyTypeService');
const ColorService = require('../service/car/colorService');
const FuelService = require('../service/car/fuelService');
const ManufacturerTypeService = require('../service/car/manufacturerTypeService');
const ProductionTimeService = require('../service/car/productionTimeService');

exports.getAllCars = async (req,res,next) => {

    if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
    }
    try {
        const cars = await CarModell.getAllCars();
        if( cars !== null) { 
            res.status(200).json({message: 'Querry success', data: cars});
        } else { 
            res.status(200).json({message: 'There is no data in database'});
        }
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}

exports.getAllCarsByStatus = async (req,res,next) => {

    if(req.user_role === 'customer') {
            return res.status(403).json({ message: 'Access denied'})
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
        res.status(500).json({message: error.message})
    }
}
exports.insertCar = async (req,res,next) => {
    // jogosultság hiányzik
    const { vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time, color, bodytype, fuel, manufacturer, type } = req.body;
    try {
        const idlocation = req.idlocation;
        const production_time_idproduction_time = await ProductionTimeService.insertProductionTime(production_time);
        const colors_idcolor = await ColorService.insertColor(color);
        const bodytypes_idbodytype = await BodyTypeService.insertBodyType(bodytype);
        const fuels_idfuel = await FuelService.insertFuel(fuel);
        const manufacturer_types_idmanufacturer_types = await ManufacturerTypeService.insertManufacturerType(manufacturer,type);
        const insertCar = new CarModell(vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time_idproduction_time, colors_idcolor, bodytypes_idbodytype, fuels_idfuel,idlocation, manufacturer_types_idmanufacturer_types);
        const id = await insertCar.saveCar();
        return res.status(201).json({ message: "Car inserted successfully", carId: id});
        } catch (error) {
        res.status(500).json({message: error.message})
    }
}
exports.updateCar = async (req,res,next) => {
    const { vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time, color, bodytype, fuel, manufacturer, type, idLocation } = req.body;
    try{
        const idlocation = req.idlocation;
        const { carsId } = req.params;
        console.log(carsId);
        const carDbObject = req.carDb;
        const carDbVinNumber = carDbObject.vin_number;
        const carDbLicencePlate = carDbObject.licence_plate;
        let validatedVinNumber;
        let validatedLicencePlate;
        if (carDbVinNumber !== vin_number){
            // Vin number is exist in db by an other record
            const getCarObjByVinNumber = await CarModell.getCarByVinNumber(vin_number);
            if(getCarObjByVinNumber !== null){
                return res.status(409).json({ message: "Vin number is already exsist in db"})
            }
        }
        if (carDbLicencePlate !== licence_plate){
            // Licence plate is exist in db by other record
            const getCarObjByLicencePlate = await CarModell.getCarByLicencePlate(licence_plate);
            if(getCarObjByLicencePlate !== null){
                return res.status(409).json({ message: "Vin number is already exsist in db"})
            }
        }
        validatedVinNumber = vin_number;
        validatedLicencePlate = licence_plate;
        const production_time_idproduction_time = await ProductionTimeService.insertProductionTime(production_time);
        const colors_idcolor = await ColorService.insertColor(color);
        const bodytypes_idbodytype = await BodyTypeService.insertBodyType(bodytype);
        const fuels_idfuel = await FuelService.insertFuel(fuel);
        const manufacturer_types_idmanufacturer_types = await ManufacturerTypeService.insertManufacturerType(manufacturer,type);
        const updatedCar = new CarModell(validatedVinNumber, car_performance, engine_size, validatedLicencePlate, technical_validity, production_time_idproduction_time, colors_idcolor, bodytypes_idbodytype, fuels_idfuel,idlocation, manufacturer_types_idmanufacturer_types);
        await updatedCar.updateCar(carsId);
        return res.status(201).json({ message: "Car updated successfully"});
    } catch (error) {
        res.status(500).json({message: error.message})
    }
}
