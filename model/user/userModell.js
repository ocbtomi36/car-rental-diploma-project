const db = require('../../database/database');
const ModellValidator = require('../modellValidadator');

module.exports = class User {
    constructor(given_name, family_name,pin_number, user_role, email, password,is_employed, addresses_idaddress, phone_number) {

        this.given_name = given_name; 
        this.family_name = family_name; 
        this.pin_number = pin_number; 
        this.user_role = user_role; 
        this.email = email;
        this.password = password;
        this.is_employed = is_employed;
        this.addresses_idaddress = addresses_idaddress;
        this.phone_number = phone_number
    }

    /* User with both role */

    static async getOneUserAuthDataFromUsersById(iduser) {
        
        try {
            const [row] = await db.query('SELECT fired_at, is_employed, user_role FROM users where iduser = ?', [iduser]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }


    static async getOneUserDataById(iduser){
        
        try {
            const [row] = await db.query('SELECT * FROM vw_user where iduser = ?', [iduser]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }

    static async getIdAndPinNumberByPinNumber(pin_number){
       
        try {
            const [row] = await db.query('SELECT iduser, pin_number FROM vw_user where pin_number = ?', [pin_number]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }
    /* A login-hez kell  */
    static async getOneUserByIncommingEmail(eMail) {
        
        try {
            const [row] = await db.query(
            'SELECT * FROM users WHERE email = ? LIMIT 1',
            [eMail]
        );
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            throw error;
        }
    }

    /* Employee for CRUD*/
    async saveEmployee(){
        try {
            const [result] = await db.execute('INSERT INTO users (given_name, family_name, pin_number, user_role, email, password,is_employed, addresses_idaddress, phone_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [this.given_name,this.family_name,this.pin_number, this.user_role,this.email,this.password,this.is_employed,this.addresses_idaddress, this.phone_number]);
            return result.insertId;
        } catch (error) {
            throw error;
        }
    }

    static async getAllEmployeeData(){
        try {
            const [row] = await db.query('SELECT * FROM vw_employee');
            return row.length > 0 ? row : null;
        } catch (error) {
            
            throw error;
        }
    }

    static async getOneEmployeeDataById(iduser){
        
        try {
            const [row] = await db.query('SELECT * FROM vw_employee where iduser = ?', [iduser]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }
    async updateEmployeeData(iduser) {
        try {
            const [ result ] = await db.execute('UPDATE users SET given_name = ?, family_name = ?, pin_number = ?, user_role = ?, email = ?, password = ?, `addresses_idaddress` = ?, phone_number = ? WHERE (iduser = ?);',
                [this.given_name,this.family_name,this.pin_number,this.user_role,this.email,this.password,this.addresses_idaddress,this.phone_number,validatedIduser]);
            
            return result
        } catch (error) {
            throw error;
        }
    }

    static async setEmployeeStatus(iduser,is_employed) {
        
        try {
            const [ result ] = await db.execute('UPDATE users SET is_employed = ? WHERE (iduser = ?);',[is_employed,iduser]);
            return result.insertId;
        } catch (error) {
            
            throw error;
        }
    }

    /* Querries for checking data duplication of employee */
    
    static async getOneEmployeeIdByEmail(email){
        
        try {
            const [row] = await db.query('SELECT iduser FROM vw_employee where email = ?', [email]);
            return row.length > 0 ? row[0].iduser : null;
        } catch (error) {
            
            throw error;
        }
    }

    static async getOneEmployeeIdByPinNumber(pin_number){
        
        try {
            const [row] = await db.query('SELECT iduser FROM vw_employee where pin_number = ?', [pin_number]);
            return row.length > 0 ? row[0].iduser : null;
        } catch (error) {
            
            throw error;
        }
    }
    /* Duplázás, u.azt csinálja mint a getOneUserDataByEmail csak az employee táblábol szedi kérdéses, hogy nem e kódduplikálás */
    static async getOneEmployeeDataByEmail(email){
        
        try {
            const [row] = await db.query('SELECT * FROM vw_employee where email = ?', [email]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }
    /* Customer */

    async saveCustomer(){
        try {
            const [result] = await db.execute('INSERT INTO users (given_name, family_name, pin_number, user_role, email, password, is_employed,addresses_idaddress, phone_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [this.given_name,this.family_name,this.pin_number,'customer',null,null,null,this.addresses_idaddress,this.phone_number]);
            return result.insertId;
        } catch (error) {
            
            throw error;
        }
         
    }
    static async getAllCustomerData(){
        try {
            const [row] = await db.query('SELECT * FROM vw_customer');
            return row.length > 0 ? row : null;
        } catch (error) {
            
            throw error;
        }
    }

    static async getOneCustomerDataById(iduser){
        
        try {
            const [row] = await db.query('SELECT * FROM vw_customer where iduser = ?', [iduser]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }
    async updateCustomerData(iduser) {
        
        try {
            const [ result ] = await db.execute('UPDATE users SET given_name = ?, family_name = ?, pin_number = ?, user_role = ?, email = ?, password = ?, is_employed = ?,addresses_idaddress = ?, phone_number = ? WHERE (iduser = ?);',
                [this.given_name,this.family_name,this.pin_number,this.user_role,this.email,this.password,this.is_employed,this.addresses_idaddress,this.phone_number,iduser]);
            return result.insertId;
        } catch (error) {
            
            throw error;
        }
    }
    /* Validációs lekérdezések a usernek*/

    static async getOneUserDataByPinNumber(pin_number){
        
        try {
            const [row] = await db.query('SELECT iduser,pin_number FROM vw_user where pin_number = ?', [pin_number]);
            return row.length > 0 ? row[0] : null;
        } catch (error) {
            
            throw error;
        }
    }


}