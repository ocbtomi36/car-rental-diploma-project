const ProductionTimeModell = require('../../model/car/productionTimeModell');

module.exports = class ProductionTimeService {

    static async insertProductionTime(productionTime){
        const querryResultProdTime = await ProductionTimeModell.getProductionTimeByProductionTime(productionTime);
        if(querryResultProdTime !== null){
            return querryResultProdTime.idproduction_time;
        } 
        const insertProdTime = new ProductionTimeModell(productionTime);
        try{
            const id = await insertProdTime.saveProductionTime();
            return id;
        } catch (error){
            throw error;
        }
    }
}