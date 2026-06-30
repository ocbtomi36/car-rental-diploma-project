const TransactionModell = require('../model/transaction/transactionModell');


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

exports.insertTransaction = async (req,res,next) => {
    if(req.user_role === 'customer') {
            const error = new Error('Access denied');
            error.statusCode = 403;
            return next(error);
    }
    const { transaction_name, cars_idcar } = req.body;
    const carStatus = req.carDb.status;
    const users_iduser = req.iduser;
    if(((carStatus === 'available' && transaction_name === 'suspended') || (carStatus === 'suspended' && transaction_name === 'activated')) && req.user_role !== 'admin') {

        const error = new Error('You dont have any permisson to do suspend and activate transaction');
        error.statusCode = 403;
        return next(error);
    }
    try {
        if (carStatus === 'available' && ( transaction_name === 'rent' || transaction_name === 'sold' || transaction_name === 'inservice' || transaction_name === 'suspended')) {
            const insertTransaction = new TransactionModell(transaction_name, users_iduser, cars_idcar);
            await insertTransaction.insertTransaction();
            return res.status(200).json({ message: 'Insert successfully'})
        }
        else if( carStatus === 'rented' && transaction_name === 'rented-back'){
            const insertTransaction = new TransactionModell(transaction_name, users_iduser, cars_idcar);
            await insertTransaction.insertTransaction();
            return res.status(200).json({ message: 'Insert successfully'})
        }
        else if( carStatus === 'sold' && transaction_name === 'buyback'){
            const insertTransaction = new TransactionModell(transaction_name, users_iduser, cars_idcar);
            await insertTransaction.insertTransaction();
            return res.status(200).json({ message: 'Insert successfully'})
        }
        else if( carStatus === 'inservice' && transaction_name === 'service-back'){
            const insertTransaction = new TransactionModell(transaction_name, users_iduser, cars_idcar);
            await insertTransaction.insertTransaction();
            return res.status(200).json({ message: 'Insert successfully'})
        }
        else if( carStatus === 'suspended' && transaction_name === 'activated'){
            const insertTransaction = new TransactionModell(transaction_name, users_iduser, cars_idcar);
            await insertTransaction.insertTransaction();
            return res.status(200).json({ message: 'Insert successfully'})
        } else {
            const error = new Error('Invalid transaction');
            error.statusCode = 400;
            return next(error);
        }
    } catch (error) {
        return next(error);
    }
}