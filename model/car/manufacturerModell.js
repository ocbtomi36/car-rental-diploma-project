const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');
module.exports = class Manufacturer {

    constructor(manufacturer){
        ModellValidator.validateOneField("manufacturer",manufacturer);

        this.manufacturer = manufacturer
    }

    async saveManufacturer(){
            try {
                const [result] = await db.execute('INSERT INTO manufacturers ( manufacturer ) VALUES ( ? )',
                    [this.manufacturer]);
                    return result.insertId;
                } catch (error) {
                    console.error('There is an error in database:', error);
                    throw error;
                }
            }
    static async getManufacturerByManufacturer(manufacturer){
        const validatedManufacturer = ModellValidator.validateOneField("manufacturer",manufacturer);
        try {
            const [row] = await db.query('SELECT * FROM manufacturers where manufacturer = ?',[validatedManufacturer]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
            console.error('There is an error in database:', error);
                throw error;
            }
    }
}