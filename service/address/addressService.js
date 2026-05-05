const Address = require('../../model/adress/adressModell');
const StreetTypeService = require('../address/streetTypeService');
const LocalityNameService = require('../address/localityNameService');

module.exports = class AddressService {

    static async insertAddress(locality_name, postal_code, street_name, street_type, house_number) {

        const fkStreetType = await StreetTypeService.insertStreetType(street_type);
        const fkLocalityName = await LocalityNameService.insertLocalityName(locality_name);

        const address = new Address(postal_code, street_name, house_number, fkLocalityName, fkStreetType);
        const queryAddress = await address.getAdresses();

        const fkAddress = queryAddress ? queryAddress.idaddress : await address.saveAddresses();

        return fkAddress;


    }

}