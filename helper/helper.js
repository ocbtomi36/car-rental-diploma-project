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
        const resultUser = await User.getOneUserDataFromUsersById(iduser);
        console.log(resultUser);
        if(!resultUser) {
            return null;
        } else {
            return resultUser.user_role;
        }
    } catch (error) {
        throw error;
    }
}

function validateParam(paramName) {
    return (req, res, next) => {
        const id = req.params[paramName];
        if (!id || id.trim() === '' || !Number.isInteger(Number(id))) {
            const error = new Error(`Invalid parameter: ${paramName}`);
            error.statusCode = 400;
            return next(error);
        }
        next();
    };
}



module.exports = {
    getsUserRoleById,
    validateParam
}