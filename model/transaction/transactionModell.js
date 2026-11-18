const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');


module.exports = class Transaction {

    constructor(transaction_name ,users_iduser, cars_idcar){
        

        this.users_iduser = users_iduser;
        this.cars_idcar = cars_idcar;
        this.transaction_name = transaction_name;
    }

    static async getAllTransaction(limit, offset) {
        try{
            const [row] = await db.query('SELECT *, COUNT(idtransaction) OVER() as totalRecords FROM vw_transactions LIMIT ? OFFSET ?',[limit,offset]);
            return row.length > 0 ? row : null;
        } catch(error){
            console.log(error);
            throw error;
        }
    }

     async insertTransaction() {
        try {
            const [result] = await db.execute('INSERT INTO transactions (transaction_name, users_iduser, cars_idcar) VALUES (?, ?, ?)',
                [this.transaction_name, this.users_iduser, this.cars_idcar]);
                return result.insertId;
            } catch (error) {
                console.log(error)
                throw error;
            }
        }
}