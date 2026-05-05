const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');

module.exports = class LocalityName {

    constructor(locality_name) {
        ModellValidator.validateOneField("locality_name",locality_name);
        this.locality_name = locality_name;
    }

    async saveLocalityName(){
        try {
            const [result] = await db.execute('INSERT INTO locality_names (locality_name) VALUES (?)',
                [this.locality_name]);
                return result.insertId;
            } catch (error) {
                console.error('There is an error in database:', error);
                throw error;
            }
                 
    }
    static async getLocalityNameByLocName(localityName){
        ModellValidator.validateOneField("localityName",localityName)
        try {
            const [row] = await db.query('SELECT * FROM locality_names where locality_name = ?',[localityName]);
                return row.length > 0 ? row[0] : null;
            } catch (error) {
                console.error('There is an error in database:', error);
                throw error;
            }
    }
}