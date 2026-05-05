const { getsUserRoleById } = require('../../helper/helper');

module.exports = async (req,res,next)=> {
        
    try {
        const resultUserRole = await getsUserRoleById(req.iduser);
        if(resultUserRole === null) {
            res.status(401).json({message: 'User not found or invalid token'})
        }
        if(resultUserRole === undefined) {
            res.status(500).json({message: 'An error occured by user querry'})
        }
        req.user_role = resultUserRole;
    } catch {
        res.status(500).json({message: error.message})
    }
    
    next();
}