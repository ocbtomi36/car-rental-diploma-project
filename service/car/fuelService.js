const FuelModell = require('../../model/car/fuelModell');

module.exports = class FuelService {

    static async insertFuel(fuel){
        const querryResultFuel = await FuelModell.getFuelByFuel(fuel);
        if(querryResultFuel !== null){
            return querryResultFuel.idfuel;
        } 
        const insertFuel = new FuelModell(fuel);
        try{
            const id = await insertFuel.saveFuel(fuel);
            return id;
        } catch (error){
            throw error;
        }
    }
}