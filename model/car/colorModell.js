const db = require('../../database/database')
const ModellValidator = require('../modellValidadator');

module.exports = class Color {

    constructor(color){
        ModellValidator.validateOneField("color",color);
        this.color = color
    }

    async saveColor(){
            try {
                const [result] = await db.execute('INSERT INTO colors (color) VALUES ( ? )',
                    [this.color]);
                    return result.insertId;
                } catch (error) {
                    throw error;
                }
            }
    static async getColorByColor(color){
        const validatedColor = ModellValidator.validateOneField("color",color);
        try {
            const [row] = await db.query('SELECT * FROM colors where color = ?',[validatedColor]);
                return row.length > 0 ? row[0] : null;
        } catch (error) {
                throw error;
            }
        }
}