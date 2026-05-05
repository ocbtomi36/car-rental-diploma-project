const ManufacturerModell = require('../../model/car/manufacturerModell');

module.exports = class ManufacturerService {

    static async insertManufacturer(manufacturer){
        const querryResultManufacturer = await ManufacturerModell.getManufacturerByManufacturer(manufacturer);
        if(querryResultManufacturer !== null){
            return querryResultManufacturer.idmanufacturer;
        } 
        const insertManufacturer = new ManufacturerModell(manufacturer);
        try{
            const id = await insertManufacturer.saveManufacturer();
            return id;
        } catch (error) {
            throw error;
        }
    }
}