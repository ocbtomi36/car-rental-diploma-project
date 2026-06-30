const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');
module.exports = class TypeModell {

    constructor(type){
        ModellValidator.validateOneField("type",type);

        this.type = type
    }

    async saveType(){
            try {
                const [result] = await db.execute('INSERT INTO types (type) VALUES ( ? )',
                    [this.type]);
                    return result.insertId;
                } catch (error) {
                    throw error;
                }
            }
    static async getTypeByType(type){

        const validatedType = ModellValidator.validateOneField("type",type);
        try {
            const [row] = await db.query('SELECT * FROM types where type = ?',[validatedType]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
    }
}