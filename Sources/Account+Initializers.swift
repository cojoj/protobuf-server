//
//  Account+Initializers.swift
//  protobuf-server
//
//  Created by Michał Cichoń on 22/05/2017.
//
//

extension Account {
    public init(id: UInt64? = nil, name: String? = nil, balance: Double? = nil, availableFunds: Double? = nil, iban: String? = nil, currency: String? = nil, owner: String? = nil, ownerAddress: String? = nil, transactions: [Transaction] = []) {
        if let v = id {
            self.id = v
        }
        
        if let v = name {
            self.name = v
        }
        
        if let v = balance {
            self.balance = v
        }
        
        if let v = availableFunds {
            self.availableFunds = v
        }
        
        if let v = iban {
            self.iban = v
        }
        
        if let v = currency {
            self.currency = v
        }
        
        if let v = owner {
            self.owner = v
        }
        
        if let v = ownerAddress {
            self.ownerAddress = v
        }
        
        if !transactions.isEmpty {
            self.transactions = transactions
        }
    }
}
