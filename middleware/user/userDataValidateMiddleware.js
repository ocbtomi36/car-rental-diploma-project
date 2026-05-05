const User = require('../../model/user/userModell');

class UserDataValidateMiddleware {

   static async checkCustomerId(req,res,next) {
        const { iduser } = req.params;
        const getUser = await User.getOneCustomerDataById(iduser);
        if(getUser === null) {
            return res.status(409).json({ message: 'There is no customer with that id'})
        }
        req.user = getUser;
        next();
    }

    static async checkEmployeeId(req,res,next) {
        const { iduser } = req.params;
        const getUser = await User.getOneEmployeeDataById(iduser);
        if(getUser === null) {
            return res.status(409).json({ message: 'There is no employee with that id'})
        }
        req.user = getUser;
        next();
    }

    static async checkEmployeeIdByIncommingUserId(req,res,next) {
        const { users_iduser } = req.body;
        const getUser = await User.getOneEmployeeDataById(users_iduser);
        if(getUser === null) {
            return res.status(409).json({ message: 'There is no employee with that id'})
        }
        req.user = getUser;
        next();
    }


    static async checkPinNumber(req,res,next) {
        const { pin_number } = req.body;
        const isPinNumberExists = await User.getIdAndPinNumberByPinNumber(pin_number);
        if(isPinNumberExists){
            return res.status(409).json({ message: 'Pin number must be unique'})
        }
        next();
    }

    static async checkEmail(req,res,next) {
        const { email } = req.body;
        const isEmailExists = await User.getOneUserByIncommingEmail(email);
        if(isEmailExists){
            return res.status(409).json({ message: 'Email must be unique'})
        }
        next();
    }
/* Ez akkor jo amikor beszurok vagy updateelek*/
    static async checkUserRole(req,res,next) {
            const { user_role } = req.body;
            const userRoles = ['admin','manager','employee'];
            if(!userRoles.includes(user_role)){
            return res.status(422).json({
                message: 'User role validation failed',
            })
        }
        next()
    }
}

module.exports = UserDataValidateMiddleware;
