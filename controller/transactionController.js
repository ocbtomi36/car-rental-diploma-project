const TransactionModell = require('../model/transaction/transactionModell');


const insert = async(req, res,next, carStatusParam,transactionName) => {
    if(req.user_role === 'customer') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    const { transaction_name, cars_idcar } = req.body;
    const carStatus = req.carDb.status;
    const users_iduser = req.iduser;
    if(carStatus !== carStatusParam) {
        const error = new Error('Transaction is not allowed');
        error.statusCode = 409;
        return next(error);
        }
        console.log(transaction_name)
        console.log(transactionName)
        if(transaction_name !== transactionName) {
            const error = new Error('Wrong transaction type');
            error.statusCode = 422;
        return next(error);
    }
    try {
        const insertTransaction = new TransactionModell(transaction_name, users_iduser, cars_idcar);
        await insertTransaction.insertTransaction();
        return res.status(201).json({ message: 'Insert successfully'})
        } catch (error) {
            return next(error);
        }
}

    exports.getAllTransactions = async (req,res,next) => {
        if(req.user_role === 'customer') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
        }
        try {
            const transactions = await TransactionModell.getAllTransaction();
            if(transactions !== null) { 
                res.status(200).json({message: 'Querry success', data: transactions});
            } else { 
                res.status(200).json({message: 'There is no data in database'});
            }
        } catch (error) {
            return next(error);
        }
}


exports.insertRentTransaction = async (req,res,next) => {
    
    return insert(req,res,next,'available','rent');

}
exports.insertRentBackTransaction = async (req,res,next) => {

    return insert(req,res,next,'rented','rented-back');

}

exports.insertSoldTransaction = async (req,res,next) => {

    return insert(req,res,next,'available','sold');

}

exports.insertBuyBackTransaction = async (req,res,next) => {

    return insert(req,res,next,'sold','buyback');
    
}

exports.insertInserviceTransaction = async (req,res,next) => {

    return insert(req,res,next,'available','inservice');

}

exports.insertServiceBackTransaction = async (req,res,next) => {

    return insert(req,res,next,'inservice','service-back');

}
exports.insertSuspendedTransaction = async (req,res,next) => {

    return insert(req,res,next,'available','suspended');

}

exports.insertActivatedTransaction = async (req,res,next) => {

    return insert(req,res,next,'suspended','activated');

}
