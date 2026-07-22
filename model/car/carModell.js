const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');

module.exports = class Car {    

    constructor(vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time_idproduction_time, colors_idcolor, bodytypes_idbodytype, fuels_idfuel,locations_idlocation, manufacturer_type_id ){
        
        this.vin_number = vin_number;
        this.car_performance = car_performance; 
        this.engine_size = engine_size;
        this.licence_plate = licence_plate; 
        this.technical_validity = technical_validity; 
        this.production_time_idproduction_time = production_time_idproduction_time; 
        this.colors_idcolor = colors_idcolor; 
        this.bodytypes_idbodytype = bodytypes_idbodytype; 
        this.fuels_idfuel = fuels_idfuel;
        this.locations_idlocation = locations_idlocation; 
        this.manufacturer_type_id = manufacturer_type_id;

    }

    static async getAllCars(){
            try {
                const [row] = await db.query('SELECT * FROM vw_cars');
                    return row.length > 0 ? row : null;
            } catch (error) {
                
                    throw error;
            }
    }

    static async getOneCar(idcar){
            try {
                const [row] = await db.query('SELECT * FROM vw_cars where idcar = ?',[idcar]);
                    return row.length > 0 ? row[0] : null;
            } catch (error) {
                    throw error;
            }
    }

    static async getAllCarsByStatus(status){
            try {
                const allowed = ['available','rented','inservice','sold','suspended'];

                if (!allowed.includes(status)){
                    throw new Error('Invalid status')
                }
                const [row] = await db.query('SELECT * FROM vw_cars where status = ?',[status]);
                    return row.length > 0 ? row : null;
            } catch (error) {
                
                    throw error;
            }
    }
    async saveCar(){
            try {
                const [ result ] = await db.execute('INSERT INTO cars (vin_number, car_performance, engine_size, licence_plate, technical_validity, production_time_idproduction_time, colors_idcolor, bodytypes_idbodytype, fuels_idfuel, locations_idlocation, manufacturer_type_id) VALUES (?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?);',[this.vin_number,this.car_performance,this.engine_size,this.licence_plate,this.technical_validity,this.production_time_idproduction_time,this.colors_idcolor,this.bodytypes_idbodytype,this.fuels_idfuel,this.locations_idlocation,this.manufacturer_type_id]);
                return result.insertId;
            } catch (error) {
                throw error;
            }
    }

    async updateCar(carId){
        try {
            const [result] = await db.execute('UPDATE cars SET vin_number = ? , car_performance = ?, engine_size = ?, licence_plate = ?, technical_validity = ?, production_time_idproduction_time = ?, colors_idcolor = ?, bodytypes_idbodytype = ?, fuels_idfuel = ?, locations_idlocation = ?, manufacturer_type_id = ? WHERE (idcar = ?);', [this.vin_number,this.car_performance,this.engine_size,this.licence_plate,this.technical_validity,this.production_time_idproduction_time,this.colors_idcolor,this.bodytypes_idbodytype,this.fuels_idfuel,this.locations_idlocation,this.manufacturer_type_id,carId]);
        } catch (error) {
            console.log(error)
            throw error;
        }
    }

    static async getCarByVinNumber(vin_number){
            try {
                const [row] = await db.query('SELECT * FROM cars where vin_number = ?',[vin_number]);
                    return row.length > 0 ? row[0] : null;
            } catch (error) {              
                    throw error;
            }
        }
    static async getCarById(carId){
            try {
                const [row] = await db.query('SELECT * FROM cars where idcar = ?',[carId]);
                    return row.length > 0 ? row[0] : null;
            } catch (error) {
                    throw error;
            }
        }
    static async getCarByLicencePlate(licencePlate){
            
            try {
                const [row] = await db.query('SELECT * FROM cars where licence_plate = ?',[licencePlate]);
                    return row.length > 0 ? row[0] : null;
            } catch (error) {
                    throw error;
            }
        }
}


