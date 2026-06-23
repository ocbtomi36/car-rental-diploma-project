const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
    const authHeader = req.get('Authorization');
    if(!authHeader) {
       const error = new Error('Auth header is not set');
       error.statusCode = 401;
       return next(error);
    }
    const token = req.get('Authorization').split(' ')[1];
    let decodedToken;
    try {
        decodedToken = jwt.verify(token, process.env.JWT_PASSWORD);
    } catch(err) {
        const error = new Error('JWT verification failed');
        error.statusCode = 401;
        return next(error);
    }
    if(!decodedToken) {
       const error = new Error('Not authenticated');
        error.statusCode = 401;
        return next(error);
    }
    req.iduser = decodedToken.iduser;
    next();
}