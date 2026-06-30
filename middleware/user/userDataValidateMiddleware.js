const User = require('../../model/user/userModell');

class UserDataValidateMiddleware {

   static async checkCustomerId(req,res,next) {
        const { iduser } = req.params;

        try{
            const getUser = await User.getOneCustomerDataById(iduser);
            if(getUser === null) {
                return res.status(409).json({ message: 'There is no customer with that id'})
            }
            req.user = getUser;
            next();
        } catch (error) {
            next(error)
        }
    }

    static async checkEmployeeId(req,res,next) {
        const { iduser } = req.params;
        let getUser;
        try {
            getUser = await User.getOneEmployeeDataById(iduser);
            req.user = getUser;
            next();
        } catch (error) {
            next(error)
        }
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
        try {
            const isPinNumberExists = await User.getIdAndPinNumberByPinNumber(pin_number);
            if(isPinNumberExists){
                const error = new Error('Pin number must be unique');
                error.statusCode = 409;
                return next(error);
            }
        } catch (error) {
            return next(error);
        }
        next();
    }

    static async checkEmail(req,res,next) {
        const { email } = req.body;
        try {
            const isEmailExists = await User.getOneUserByIncommingEmail(email);
            if(isEmailExists){
                const error = new Error('Email must be unique');
                error.statusCode = 409;
                return next(error)
            }
        } catch (error) {
            return next(error)
        }
        next();
    }
/* Ez akkor jo amikor beszurok vagy updateelek*/
    static async checkUserRole(req,res,next) {
            const { user_role } = req.body;
            const userRoles = ['admin','manager','employee'];
            if(!userRoles.includes(user_role)){
                const error = new Error(`Invalid user role: ${user_role}`);
                error.statusCode = 422;
                return next(error);
        }
        return next()
    }
}

module.exports = UserDataValidateMiddleware;
