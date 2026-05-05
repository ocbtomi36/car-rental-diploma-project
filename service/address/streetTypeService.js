const StreetType = require('../../model/adress/streetTypeModell');

module.exports = class StreetTypeService {

    static async insertStreetType(street_type){
        const querryResultStreetType = await StreetType.getStreetTypesByStreetType(street_type);
        if(querryResultStreetType !== null){
            return querryResultStreetType.idstreet_type;
        }
        const streetType = new StreetType(street_type);
        try{
            return await streetType.saveStreetTypes(street_type);
        } catch (error) {
            throw error;
        }
    }
}