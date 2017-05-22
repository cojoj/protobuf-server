//
//  Transaction+Initializers.swift
//  protobuf-server
//
//  Created by Michał Cichoń on 19/05/2017.
//
//

extension Transaction {
    public init(id: UInt64? = nil, transactionType: Transaction.TransactionType = Transaction.TransactionType.credit, transactionDate: String? = nil, bookingDate: String? = nil, principalDisposal: String? = nil, orderingCustomer: String? = nil, beneficiary: String? = nil, beneficiaryAccount: String? = nil, details: String? = nil, amount: Double? = nil) {
        if let v = id {
            self.id = v
        }
        
        self.transactionType = transactionType
        
        if let v = transactionDate {
            self.transactionDate = v
        }
        
        if let v = bookingDate {
            self.bookingDate = v
        }
        
        if let v = principalDisposal {
            self.principalDisposal = v
        }
        
        if let v = orderingCustomer {
            self.orderingCustomer = v
        }
        
        if let v = beneficiary {
            self.beneficiary = v
        }
        
        if let v = beneficiaryAccount {
            self.beneficiaryAccount = v
        }
        
        if let v = details {
            self.details = v
        }
        
        if let v = amount {
            self.amount = v
        }
    }
}
