const User = require('../../../model/user/userModell');
const bcrypt = require('bcryptjs');
class employeeLoginValidateMiddleware {

    static async loginUser(req,res,next){
            const { email, password } = req.body;   
            
            try{
                const loadedUser = await User.getOneUserByIncommingEmail(email);
                if(loadedUser === null){
                    return res.status(401).json({ message: 'There is no user with that email' })
                }
                const loadedPassword = loadedUser.password;
                const isPasswordMatch = await bcrypt.compare(password,loadedPassword);
                
                
                if(!isPasswordMatch){
                    return res.status(401).json({ message: 'Wrong password' })
                }
                req.user = loadedUser;
                next();
            } catch (error) {
                console.log(error);
                res.status(500).json({ message: 'An login error occured'})
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