const { getsUserRoleById } = require('../../helper/helper');

module.exports = async (req,res,next)=> {
        
    try {
        const resultUserRole = await getsUserRoleById(req.iduser);
        if(resultUserRole === null) {
            const error = new Error('User not found or invalid token');
            error.statusCode = 401;
            return next(error);
        }
        if(resultUserRole === undefined) {
            const error = new Error('An error occured by querry');
            error.statusCode = 500;
            return next(error);
        }
        req.user_role = resultUserRole;
    } catch {
       next(error)
    }
    
    next();
}