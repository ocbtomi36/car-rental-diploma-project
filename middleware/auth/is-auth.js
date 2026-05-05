const jvt = require('jsonwebtoken');

module.exports = (req, res, next) => {
    const authHeader = req.get('Authorization');
    if(!authHeader) {
       return res.status(401).json({message: 'Auth header is not set'})
    }
    const token = req.get('Authorization').split(' ')[1];
    let decodedToken;
    try {
        decodedToken = jvt.verify(token, 'somesupersecretsecret');
    } catch(err) {
        return res.status(500).json({message: 'An authentication error occured'});
    }
    if(!decodedToken) {
        return res.status(401).json({message: 'Not authenticated'});
    }
    req.iduser = decodedToken.iduser;
    next();
}