const User = require('../../../model/user/userModell');
const bcrypt = require('bcryptjs');
class employeeLoginValidateMiddleware {

    static async loginUser(req,res,next){
            const { email, password } = req.body;   
            
            try{
                const loadedUser = await User.getOneUserByIncommingEmail(email);
                if(loadedUser === null){
                    const error = new Error('There is no user with that email');
                    error.statusCode = 401;
                    return next(error);
                }
                const loadedPassword = loadedUser.password;
                const isPasswordMatch = await bcrypt.compare(password,loadedPassword);
                
                
                if(!isPasswordMatch){
                    const error = new Error('wrong password');
                    error.statusCode = 401;
                    return next(error);             
                }
                req.user = loadedUser;
                next();
            } catch (error) {
                
                return next(error);
            }
        }
}

module.exports = employeeLoginValidateMiddleware;
/*

    {
    "given_name": "From json Insert",
    "family_name": "Signup",
    "user_role":"admin",
    "email":"valiaa@vali.com",
    "password":"tök",
    "pin_number": "PP111121",
    "postal_code": "1048",
    "locality_name": "Budapest",
    "street_name": "Nádasdy",
    "street_type": "utca",
    "house_number": "32",
    "phone_number": "06303645122"
    }

*/