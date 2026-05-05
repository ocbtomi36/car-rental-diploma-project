const validateAllowedFields = (allowedFields) => {
  return (req, res, next) => {
    const extraFields = Object.keys(req.body)
      .filter(key => !allowedFields.includes(key));

    if (extraFields.length > 0) {
      return res.status(400).json({
        message: 'Unexpected fields',
        fields: extraFields
      });
    }

    next();
  };
};

module.exports = validateAllowedFields;