const TypeModell = require('../../model/car/typeModell');

module.exports = class TypeService {

    static async insertType(type){
        const querryResultType = await TypeModell.getTypeByType(type);
        if(querryResultType !== null){
            return querryResultType.idtype;
        } 
        const insertType = new TypeModell(type);
        try{
            const id = await insertType.saveType(type);
            return id;
        } catch (error) {
            throw error;
        }
    }
}