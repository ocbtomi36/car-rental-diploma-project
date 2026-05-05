const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');


module.exports = class Transaction {

    constructor(transaction_name ,users_iduser, cars_idcar){

        const ValidatedUserId = ModellValidator.validateId("users_iduser",users_iduser);
        const ValidatedCarId = ModellValidator.validateId("cars_idcar",cars_idcar);
        

        this.users_iduser = ValidatedUserId;
        this.cars_idcar = ValidatedCarId;
        this.transaction_name = ModellValidator.validateOneField("transaction_name",transaction_name);
    }

    static async getAllTransaction() {
        try{
            const [row] = await db.query('SELECT * FROM vw_transaction');
            return row.length > 0 ? row : null;
        } catch(error){
            console.error('There is an error in database:', error);
            throw error;
        }
    }

     async insertTransaction() {
        try {
            const [result] = await db.execute('INSERT INTO transactions (transaction_name, users_iduser, cars_idcar) VALUES (?, ?, ?)',
                [this.transaction_name, this.users_iduser, this.cars_idcar]);
                return result.insertId;
            } catch (error) {
                console.error('There is an error in database:', error);
                throw error;
            }
        }
}