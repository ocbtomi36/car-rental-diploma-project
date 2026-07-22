const validateAllowedFields = (allowedFields) => {
  return (req, res, next) => {
    const extraFields = Object.keys(req.body)
      .filter(key => !allowedFields.includes(key));

    if (extraFields.length > 0) {
       const error = new Error('Unexpected fields');
      error.statusCode = 400;
      error.data = extraFields;
      return next(error);
    }
    next();
  };
};

module.exports = validateAllowedFields;