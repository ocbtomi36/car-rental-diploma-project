const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');

module.exports = class BodyType {

    constructor(bodyType){

        ModellValidator.validateOneField("body_type",bodyType);

        this.bodyType = bodyType
    }

    async saveBodyType(){
            try {
                const [result] = await db.execute('INSERT INTO bodytypes (bodytype) VALUES ( ? )',
                    [this.bodyType]);
                    return result.insertId;
                } catch (error) {
                    console.error('There is an error in database:', error);
                    throw error;
                }
            }
    static async getBodyTypeByBodyType(bodyType){
        const validatedBodyType = ModellValidator.validateOneField("body_type",bodyType); 
        try {
            const [row] = await db.query('SELECT * FROM bodytypes where bodytype = ?',[validatedBodyType]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
            console.error('There is an error in database:', error);
                throw error;
            }
    }
}