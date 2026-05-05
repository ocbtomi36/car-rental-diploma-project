const BodyTypeModell = require('../../model/car/bodyTypeModell');

module.exports = class BodyTypeService {

    static async insertBodyType(bodyType){
        const querryBodyType = await BodyTypeModell.getBodyTypeByBodyType(bodyType);
        if(querryBodyType !== null){
            return querryBodyType.idbodytype;
        }
        const insertBodyType = new BodyTypeModell(bodyType);
        try {
            const id = await insertBodyType.saveBodyType(bodyType);
            return id;
        } catch (error){
            throw error;
        }
    }
}