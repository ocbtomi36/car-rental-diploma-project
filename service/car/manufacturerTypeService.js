const ManufacturerTypeModell = require('../../model/car/manufacturer_types/manufacturerTypes');
const ManufacturerService = require('./manufacturerService');
const TypeService = require('./typeService');

module.exports = class ManufacturerTypeService {

    static async insertManufacturerType(type,manufacturer){
        const fkManufacturer = await ManufacturerService.insertManufacturer(manufacturer);
        const fkType = await TypeService.insertType(type);
        const getManufacturerType = await ManufacturerTypeModell.getManufacturersTypesByIds(fkType,fkManufacturer);
        try{
            if(getManufacturerType !== null){
                return getManufacturerType.idmanufacturer_types;
            } else {
            const insertManufacturerType = new ManufacturerTypeModell(fkType,fkManufacturer);
            return await insertManufacturerType.saveManufacturerTypes();
            }
        } catch (error) {
            throw error;
        }
            
    }
}