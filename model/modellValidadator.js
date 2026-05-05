class ModellValidator {


    static validateOneField(fieldName,value) {
        if(value === null || (typeof value === "string" && value.trim() === "")) {
            throw new Error(`${ fieldName } is Missing`);
        }
        return value;
    }
    static validateId(fieldName, value) {
        if (value === null || value === undefined) {
            throw new Error(`${fieldName} is missing`);
        }

        const id = Number(value);

        if (!Number.isInteger(id) || id <= 0) {
            throw new Error(`${fieldName} must be a valid positive integer`);
        }

            return id;
    }

}

module.exports = ModellValidator;