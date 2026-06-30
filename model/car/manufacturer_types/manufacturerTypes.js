const db = require('../../../database/database');
const ModellValidator = require('../../modellValidadator');

module.exports = class ManufacturerTypes {

    constructor(typesId,manufacturerId){

        const validateTypesId = ModellValidator.validateId("types_id",typesId);
        const validateManufacturerId = ModellValidator.validateId("manufacturer_id",manufacturerId);
        this.typesId = validateTypesId;
        this.manufacturerId = validateManufacturerId;
    }

    async saveManufacturerTypes(){
            try {
                const [result] = await db.execute('INSERT INTO manufacturer_types (types_idtype, manufacturers_idmanufacturer) VALUES (? , ?);',
                    [this.typesId, this.manufacturerId]);
                    return result.insertId;
                } catch (error) {
                    throw error;
                }
            }
    static async getManufacturersTypesByIds(types_idType,manufacturer_idmanufacturer){
        const validateTypesIdType = ModellValidator.validateId("types_idType",types_idType);
        const validateManufacturerIdmanufacturer = ModellValidator.validateId("manufacturer_idmanufacturer",manufacturer_idmanufacturer);
        try {
            const [row] = await db.query('SELECT * FROM manufacturer_types where types_idtype = ? and manufacturers_idmanufacturer = ?',[validateTypesIdType,validateManufacturerIdmanufacturer]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
    }
}