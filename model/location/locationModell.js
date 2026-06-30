const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');

module.exports = class Location {    

    constructor(location_name, phone_number,addresses_idaddress){
        ModellValidator.validateOneField("location_name",location_name);
        ModellValidator.validateOneField("phone_number",phone_number);
        const ValidatedAddressesIdaddress = ModellValidator.validateId("addresses_idaddress",addresses_idaddress);

        this.location_name = location_name;
        this.phone_number = phone_number;
        this.addresses_idaddress = ValidatedAddressesIdaddress;
    }

    /* Gets all data from vw_location view table */
    static async getAllLocation(){
        try{
            const [row] = await db.query('SELECT * FROM vw_location');
            return row.length > 0 ? row : null;
        } catch(error){
            throw error;
        }
    }
    /* Gets one data from vw_location view table */
    static async getOneLocationDataById(idlocation){
        idlocation = ModellValidator.validateId("idlocation",idlocation);
        try {
            const [row] = await db.query('SELECT * FROM vw_location where idlocation = ?;',[idlocation]);    
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            throw error;
        }
    }

    async saveLocation(){
        try {
            const [result] = await db.execute('INSERT INTO locations (location_name, phone_number, addresses_idaddress) VALUES (?, ?, ?)',
                [this.location_name, this.phone_number, this.addresses_idaddress]);
                return result.insertId;
            } catch (error) {

                throw error;
            }
        }
    async updateLocation(idlocation){
        idlocation = ModellValidator.validateId("idlocation",idlocation);
        try{
            const [result] = await db.execute('UPDATE locations SET location_name = ?, phone_number = ?, addresses_idaddress = ? WHERE (idlocation = ?);',
                [this.location_name, this.phone_number, this.addresses_idaddress,idlocation]);
                return result.insertId;
        } catch(error){
                throw error;
        }
    }  
    
    static async getLocationIdByLocationName(location_name){
        ModellValidator.validateOneField("location_name",location_name);
        try {
            const [row] = await db.query('SELECT * FROM vw_location where location_name = ?',[location_name]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
        }
        
    static async getPhoneNumByPhoneNum(phone_number){
        ModellValidator.validateOneField("phone number",phone_number);
        try {
            const [row] = await db.query('SELECT * FROM vw_location where phone_number = ?',[phone_number]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
        }
    static async getLocationByFkAddresses(fkAdresses){
        fkAdresses = ModellValidator.validateId("fkAdresses",fkAdresses);
        try {
            const [row] = await db.query('SELECT * FROM locations where addresses_idaddress = ?',[fkAdresses]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
        }
    static async getLocationById(incommingId){
        incommingId = ModellValidator.validateId("incommingId",incommingId);
        try {
            const [row] = await db.query('SELECT * FROM vw_location where idlocation = ?',[incommingId]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
            throw error;
        }
    }
}