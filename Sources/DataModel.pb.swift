/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: DataModel.proto
 *
 */

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _1: SwiftProtobuf.ProtobufAPIVersion_1 {}
  typealias Version = _1
}

struct Transaction: SwiftProtobuf.Message {
  static let protoMessageName: String = "Transaction"

  var id: UInt64 = 0

  var transactionType: Transaction.TransactionType = Transaction.TransactionType.credit

  var transactionDate: String = String()

  var bookingDate: String = String()

  var principalDisposal: String = String()

  var orderingCustomer: String = String()

  var beneficiary: String = String()

  var beneficiaryAccount: String = String()

  var details: String = String()

  var amount: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum TransactionType: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case credit // = 0
    case debit // = 1
    case UNRECOGNIZED(Int)

    init() {
      self = .credit
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .credit
      case 1: self = .debit
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .credit: return 0
      case .debit: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.id)
      case 2: try decoder.decodeSingularEnumField(value: &self.transactionType)
      case 3: try decoder.decodeSingularStringField(value: &self.transactionDate)
      case 4: try decoder.decodeSingularStringField(value: &self.bookingDate)
      case 5: try decoder.decodeSingularStringField(value: &self.principalDisposal)
      case 6: try decoder.decodeSingularStringField(value: &self.orderingCustomer)
      case 7: try decoder.decodeSingularStringField(value: &self.beneficiary)
      case 8: try decoder.decodeSingularStringField(value: &self.beneficiaryAccount)
      case 9: try decoder.decodeSingularStringField(value: &self.details)
      case 10: try decoder.decodeSingularDoubleField(value: &self.amount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if self.transactionType != Transaction.TransactionType.credit {
      try visitor.visitSingularEnumField(value: self.transactionType, fieldNumber: 2)
    }
    if !self.transactionDate.isEmpty {
      try visitor.visitSingularStringField(value: self.transactionDate, fieldNumber: 3)
    }
    if !self.bookingDate.isEmpty {
      try visitor.visitSingularStringField(value: self.bookingDate, fieldNumber: 4)
    }
    if !self.principalDisposal.isEmpty {
      try visitor.visitSingularStringField(value: self.principalDisposal, fieldNumber: 5)
    }
    if !self.orderingCustomer.isEmpty {
      try visitor.visitSingularStringField(value: self.orderingCustomer, fieldNumber: 6)
    }
    if !self.beneficiary.isEmpty {
      try visitor.visitSingularStringField(value: self.beneficiary, fieldNumber: 7)
    }
    if !self.beneficiaryAccount.isEmpty {
      try visitor.visitSingularStringField(value: self.beneficiaryAccount, fieldNumber: 8)
    }
    if !self.details.isEmpty {
      try visitor.visitSingularStringField(value: self.details, fieldNumber: 9)
    }
    if self.amount != 0 {
      try visitor.visitSingularDoubleField(value: self.amount, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct Account: SwiftProtobuf.Message {
  static let protoMessageName: String = "Account"

  var id: UInt64 = 0

  var name: String = String()

  var balance: Double = 0

  var availableFunds: Double = 0

  var iban: String = String()

  var currency: String = String()

  var owner: String = String()

  var ownerAddress: String = String()

  var transactions: [Transaction] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.name)
      case 3: try decoder.decodeSingularDoubleField(value: &self.balance)
      case 4: try decoder.decodeSingularDoubleField(value: &self.availableFunds)
      case 5: try decoder.decodeSingularStringField(value: &self.iban)
      case 6: try decoder.decodeSingularStringField(value: &self.currency)
      case 7: try decoder.decodeSingularStringField(value: &self.owner)
      case 8: try decoder.decodeSingularStringField(value: &self.ownerAddress)
      case 9: try decoder.decodeRepeatedMessageField(value: &self.transactions)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if self.balance != 0 {
      try visitor.visitSingularDoubleField(value: self.balance, fieldNumber: 3)
    }
    if self.availableFunds != 0 {
      try visitor.visitSingularDoubleField(value: self.availableFunds, fieldNumber: 4)
    }
    if !self.iban.isEmpty {
      try visitor.visitSingularStringField(value: self.iban, fieldNumber: 5)
    }
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 6)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 7)
    }
    if !self.ownerAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.ownerAddress, fieldNumber: 8)
    }
    if !self.transactions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.transactions, fieldNumber: 9)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Transaction: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "transactionType"),
    3: .same(proto: "transactionDate"),
    4: .same(proto: "bookingDate"),
    5: .same(proto: "principalDisposal"),
    6: .same(proto: "orderingCustomer"),
    7: .same(proto: "beneficiary"),
    8: .same(proto: "beneficiaryAccount"),
    9: .same(proto: "details"),
    10: .same(proto: "amount"),
  ]

  func _protobuf_generated_isEqualTo(other: Transaction) -> Bool {
    if self.id != other.id {return false}
    if self.transactionType != other.transactionType {return false}
    if self.transactionDate != other.transactionDate {return false}
    if self.bookingDate != other.bookingDate {return false}
    if self.principalDisposal != other.principalDisposal {return false}
    if self.orderingCustomer != other.orderingCustomer {return false}
    if self.beneficiary != other.beneficiary {return false}
    if self.beneficiaryAccount != other.beneficiaryAccount {return false}
    if self.details != other.details {return false}
    if self.amount != other.amount {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Transaction.TransactionType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "Credit"),
    1: .same(proto: "Debit"),
  ]
}

extension Account: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "balance"),
    4: .same(proto: "availableFunds"),
    5: .same(proto: "iban"),
    6: .same(proto: "currency"),
    7: .same(proto: "owner"),
    8: .same(proto: "ownerAddress"),
    9: .same(proto: "transactions"),
  ]

  func _protobuf_generated_isEqualTo(other: Account) -> Bool {
    if self.id != other.id {return false}
    if self.name != other.name {return false}
    if self.balance != other.balance {return false}
    if self.availableFunds != other.availableFunds {return false}
    if self.iban != other.iban {return false}
    if self.currency != other.currency {return false}
    if self.owner != other.owner {return false}
    if self.ownerAddress != other.ownerAddress {return false}
    if self.transactions != other.transactions {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
