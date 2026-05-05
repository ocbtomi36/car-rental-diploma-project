const User = require('../model/user/userModell')

/**
 * Gets user role by gived id
 * @param { iduser } iduser 
 * @returns undefined
 * @returns null
 * @returns user_role
 */

async function getsUserRoleById(iduser) {
    try {
        const resultUser = await User.getOneUserDataById(iduser);
        if(!resultUser) {
            return null;
        } else {
            return resultUser.user_role;
        }
    } catch (error) {
        return undefined;
    }
}

function validateParam(paramName) {
    return (req, res, next) => {
        const id = req.params[paramName];
        if (!id || id.trim() === '' || !Number.isInteger(Number(id))) {
            return res.status(400).json({
                message: `Missing parameter: ${paramName}`
            });
        }
        next();
    };
}



module.exports = {
    getsUserRoleById,
    validateParam
}