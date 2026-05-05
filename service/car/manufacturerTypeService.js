const ManufacturerTypeModell = require('../../model/car/manufacturer_types/manufacturerTypes');
const ManufacturerService = require('./manufacturerService');
const TypeService = require('./typeService');

module.exports = class ManufacturerTypeService {

    static async insertManufacturerType(manufacturer, type){
        const fkManufacturer = await ManufacturerService.insertManufacturer(manufacturer);
        const fkType = await TypeService.insertType(type);
        const getManufacturerType = await ManufacturerTypeModell.getManufacturersTypesByIds(fkManufacturer,fkType);
        try{
            if(getManufacturerType !== null){
                return getManufacturerType.idmanufacturer_types;
            } else {
            const insertManufacturerType = new ManufacturerTypeModell(fkManufacturer, fkType);
            return await insertManufacturerType.saveManufacturerTypes();
            }
        } catch (error) {
            throw error;
        }
    }
}