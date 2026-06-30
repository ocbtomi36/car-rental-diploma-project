const db = require('../../database/database');
const ModellValidaor = require('../modellValidadator');


module.exports = class Fuel {

    constructor(fuel){
        ModellValidaor.validateOneField("fuel", fuel);

        this.fuel = fuel;
    }

    async saveFuel(){
            try {
                const [result] = await db.execute('INSERT INTO fuels (fuel) VALUES ( ? )',
                    [this.fuel]);
                    return result.insertId;
                } catch (error) {
                    throw error;
                }
            }
    static async getFuelByFuel(fuel){
        const validatedFuel = ModellValidaor.validateOneField("fuel",fuel);
        try {
            const [row] = await db.query('SELECT * FROM fuels where fuel = ?',[validatedFuel]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
    }
}