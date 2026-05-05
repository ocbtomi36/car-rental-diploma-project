const ColorModell = require('../../model/car/colorModell');

module.exports = class ColorService {

    static async insertColor(color){
        const querryResultColor = await ColorModell.getColorByColor(color);
    
        if(querryResultColor !== null){
            return querryResultColor.idcolor;
        } 
        const insertColor = new ColorModell(color);
        try{
            const id = await insertColor.saveColor(color);
            return id;
        } catch (error){
            throw error;
        }
    }
}