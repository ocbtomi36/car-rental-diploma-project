const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');
module.exports = class StreetType {

    constructor(street_type) {
        ModellValidator.validateOneField("street_type",street_type);
        this.street_type = street_type;
    }

    async saveStreetTypes(){
            try {
                const [result] = await db.execute('INSERT INTO street_types (street_type) VALUES (?)',
                [this.street_type]);
                return result.insertId;
            } catch (error) {
                console.error('There is an error in database:', error);
                throw error;
            }
             
    }
    static async getStreetTypesByStreetType(streetType){
        ModellValidator.validateOneField("street_type",streetType)
            try {
                const [row] = await db.query('SELECT * FROM street_types where street_type = ?',[streetType]);
                    return row.length > 0 ? row[0] : null;
                } catch (error) {
                    console.error('There is an error in database:', error);
                    throw error;
                }
        }

}