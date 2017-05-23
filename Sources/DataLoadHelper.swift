//
//  DataLoadHelper.swift
//  protobuf-server
//
//  Created by Michał Cichoń on 23/05/2017.
//
//

import Foundation

class DataLoadHelper {
    class func loadStringFromFile(filename: String) -> String? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "csv") else {
            return nil
        }
        
        do {
            return try String(contentsOfFile: path)
        } catch {
            print(error)
            return nil
        }
    }
    
    class func loadAccounts() -> Array<Account> {
        let filename = "accounts"
        var accounts = [Account]()
        var accountRows: Array<String>
        if let accountFileString = DataLoadHelper.loadStringFromFile(filename: filename) {
            accountRows = accountFileString.components(separatedBy: .newlines)
        } else {
            return []
        }
        
        for accountRow in accountRows {
            if accountRow == "" {
                continue
            }
            let fields = accountRow.components(separatedBy: ";")
            var account = Account(id: UInt64(fields[0]), name: fields[1], balance: Double(fields[2]), availableFunds: Double(fields[3]), iban: fields[4], currency: fields[5], owner: fields[6], ownerAddress: fields[7], transactions: [])
            account.transactions = DataLoadHelper.loadTransactions(id: account.id)
            accounts.append(account)
        }
        
        return accounts
    }
    
    class func loadTransactions(id: UInt64) -> Array<Transaction> {
        let filename = "transactions_" + String(id)
        var transactions = [Transaction]()
        var transactionRows: Array<String>
        if let transactionsFileString = DataLoadHelper.loadStringFromFile(filename: filename) {
            transactionRows = transactionsFileString.components(separatedBy: .newlines)
        } else {
            transactionRows = []
        }
        
        for transactionRow in transactionRows {
            if transactionRow == "" {
                continue
            }
            let fields = transactionRow.components(separatedBy: ";")
            let transactionType = fields[1] == "0" ? Transaction.TransactionType.credit : Transaction.TransactionType.debit
            let transaction = Transaction(id: UInt64(fields[0]), transactionType: transactionType, transactionDate: fields[2], bookingDate: fields[3], principalDisposal: fields[4], orderingCustomer: fields[5], beneficiary: fields[6], beneficiaryAccount: fields[7], details: fields[8], amount: Double(fields[9]))
            transactions.append(transaction)
        }
        
        return transactions
    }
}
