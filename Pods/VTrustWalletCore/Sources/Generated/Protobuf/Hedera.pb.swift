// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Hedera.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.

import Foundation
import VSwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of VSwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: VSwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: VSwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// An exact date and time. This is the same data structure as the protobuf Timestamp.proto
/// (see the comments in https://github.com/google/protobuf/blob/master/src/google/protobuf/timestamp.proto)
public struct TW_Hedera_Proto_Timestamp {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  /// Number of complete seconds since the start of the epoch
  public var seconds: Int64 = 0

  /// Number of nanoseconds since the start of the last second
  public var nanos: Int32 = 0

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}
}

/// The ID for a transaction. This is used for retrieving receipts and records for a transaction, for
/// appending to a file right after creating it, for instantiating a smart contract with bytecode in
/// a file just created, and internally by the network for detecting when duplicate transactions are
/// submitted. A user might get a transaction processed faster by submitting it to N nodes, each with
/// a different node account, but all with the same TransactionID. Then, the transaction will take
/// effect when the first of all those nodes submits the transaction and it reaches consensus. The
/// other transactions will not take effect. So this could make the transaction take effect faster,
/// if any given node might be slow. However, the full transaction fee is charged for each
/// transaction, so the total fee is N times as much if the transaction is sent to N nodes.
///
/// Applicable to Scheduled Transactions:
///  - The ID of a Scheduled Transaction has transactionValidStart and accountIDs inherited from the
///    ScheduleCreate transaction that created it. That is to say that they are equal
///  - The scheduled property is true for Scheduled Transactions
///  - transactionValidStart, accountID and scheduled properties should be omitted
public struct TW_Hedera_Proto_TransactionID {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  /// The transaction is invalid if consensusTimestamp < transactionID.transactionStartValid
  public var transactionValidStart: TW_Hedera_Proto_Timestamp {
    get {return _transactionValidStart ?? TW_Hedera_Proto_Timestamp()}
    set {_transactionValidStart = newValue}
  }
  /// Returns true if `transactionValidStart` has been explicitly set.
  public var hasTransactionValidStart: Bool {return self._transactionValidStart != nil}
  /// Clears the value of `transactionValidStart`. Subsequent reads from it will return its default value.
  public mutating func clearTransactionValidStart() {self._transactionValidStart = nil}

  /// The Account ID that paid for this transaction
  public var accountID: String = String()

  /// Whether the Transaction is of type Scheduled or no
  public var scheduled: Bool = false

  /// The identifier for an internal transaction that was spawned as part
  /// of handling a user transaction. (These internal transactions share the
  /// transactionValidStart and accountID of the user transaction, so a
  /// nonce is necessary to give them a unique TransactionID.)
  ///
  /// An example is when a "parent" ContractCreate or ContractCall transaction
  /// calls one or more HTS precompiled contracts; each of the "child" transactions spawned for a precompile has a id
  /// with a different nonce.
  public var nonce: Int32 = 0

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _transactionValidStart: TW_Hedera_Proto_Timestamp? = nil
}

/// Necessary fields to process a TransferMessage
public struct TW_Hedera_Proto_TransferMessage {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  /// Source Account address (string)
  public var from: String = String()

  /// Destination Account address (string)
  public var to: String = String()

  /// Amount to be transferred (sint64)
  public var amount: Int64 = 0

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A single transaction. All transaction types are possible here.
public struct TW_Hedera_Proto_TransactionBody {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  /// The ID for this transaction, which includes the payer's account (the account paying the transaction fee).
  /// If two transactions have the same transactionID, they won't both have an effect
  public var transactionID: TW_Hedera_Proto_TransactionID {
    get {return _transactionID ?? TW_Hedera_Proto_TransactionID()}
    set {_transactionID = newValue}
  }
  /// Returns true if `transactionID` has been explicitly set.
  public var hasTransactionID: Bool {return self._transactionID != nil}
  /// Clears the value of `transactionID`. Subsequent reads from it will return its default value.
  public mutating func clearTransactionID() {self._transactionID = nil}

  /// The account of the node that submits the client's transaction to the network
  public var nodeAccountID: String = String()

  /// The maximum transaction fee the client is willing to pay
  public var transactionFee: UInt64 = 0

  /// The transaction is invalid if consensusTimestamp > transactionID.transactionValidStart + transactionValidDuration
  public var transactionValidDuration: Int64 = 0

  /// Any notes or descriptions that should be put into the record (max length 100)
  public var memo: String = String()

  /// The choices here are arranged by service in roughly lexicographical order. The field ordinals are non-sequential,
  /// and a result of the historical order of implementation.
  public var data: TW_Hedera_Proto_TransactionBody.OneOf_Data? = nil

  /// Transfer amount between accounts
  public var transfer: TW_Hedera_Proto_TransferMessage {
    get {
      if case .transfer(let v)? = data {return v}
      return TW_Hedera_Proto_TransferMessage()
    }
    set {data = .transfer(newValue)}
  }

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  /// The choices here are arranged by service in roughly lexicographical order. The field ordinals are non-sequential,
  /// and a result of the historical order of implementation.
  public enum OneOf_Data: Equatable {
    /// Transfer amount between accounts
    case transfer(TW_Hedera_Proto_TransferMessage)

  #if !swift(>=4.1)
    public static func ==(lhs: TW_Hedera_Proto_TransactionBody.OneOf_Data, rhs: TW_Hedera_Proto_TransactionBody.OneOf_Data) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.transfer, .transfer): return {
        guard case .transfer(let l) = lhs, case .transfer(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _transactionID: TW_Hedera_Proto_TransactionID? = nil
}

/// Input data necessary to create a signed transaction.
public struct TW_Hedera_Proto_SigningInput {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  /// Private key to sign the transaction (bytes)
  public var privateKey: Data = Data()

  /// The transaction body
  public var body: TW_Hedera_Proto_TransactionBody {
    get {return _body ?? TW_Hedera_Proto_TransactionBody()}
    set {_body = newValue}
  }
  /// Returns true if `body` has been explicitly set.
  public var hasBody: Bool {return self._body != nil}
  /// Clears the value of `body`. Subsequent reads from it will return its default value.
  public mutating func clearBody() {self._body = nil}

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _body: TW_Hedera_Proto_TransactionBody? = nil
}

/// Transaction signing output.
public struct TW_Hedera_Proto_SigningOutput {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  /// Signed and encoded transaction bytes.
  public var encoded: Data = Data()

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the VSwiftProtobuf runtime.

fileprivate let _protobuf_package = "TW.Hedera.Proto"

extension TW_Hedera_Proto_Timestamp: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Timestamp"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .same(proto: "seconds"),
    2: .same(proto: "nanos"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.seconds) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.nanos) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.seconds != 0 {
      try visitor.visitSingularInt64Field(value: self.seconds, fieldNumber: 1)
    }
    if self.nanos != 0 {
      try visitor.visitSingularInt32Field(value: self.nanos, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Hedera_Proto_Timestamp, rhs: TW_Hedera_Proto_Timestamp) -> Bool {
    if lhs.seconds != rhs.seconds {return false}
    if lhs.nanos != rhs.nanos {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Hedera_Proto_TransactionID: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TransactionID"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .same(proto: "transactionValidStart"),
    2: .same(proto: "accountID"),
    3: .same(proto: "scheduled"),
    4: .same(proto: "nonce"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._transactionValidStart) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.accountID) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.scheduled) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.nonce) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._transactionValidStart {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.accountID.isEmpty {
      try visitor.visitSingularStringField(value: self.accountID, fieldNumber: 2)
    }
    if self.scheduled != false {
      try visitor.visitSingularBoolField(value: self.scheduled, fieldNumber: 3)
    }
    if self.nonce != 0 {
      try visitor.visitSingularInt32Field(value: self.nonce, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Hedera_Proto_TransactionID, rhs: TW_Hedera_Proto_TransactionID) -> Bool {
    if lhs._transactionValidStart != rhs._transactionValidStart {return false}
    if lhs.accountID != rhs.accountID {return false}
    if lhs.scheduled != rhs.scheduled {return false}
    if lhs.nonce != rhs.nonce {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Hedera_Proto_TransferMessage: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TransferMessage"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .same(proto: "from"),
    2: .same(proto: "to"),
    3: .same(proto: "amount"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.from) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.to) }()
      case 3: try { try decoder.decodeSingularSInt64Field(value: &self.amount) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.from.isEmpty {
      try visitor.visitSingularStringField(value: self.from, fieldNumber: 1)
    }
    if !self.to.isEmpty {
      try visitor.visitSingularStringField(value: self.to, fieldNumber: 2)
    }
    if self.amount != 0 {
      try visitor.visitSingularSInt64Field(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Hedera_Proto_TransferMessage, rhs: TW_Hedera_Proto_TransferMessage) -> Bool {
    if lhs.from != rhs.from {return false}
    if lhs.to != rhs.to {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Hedera_Proto_TransactionBody: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TransactionBody"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .same(proto: "transactionID"),
    2: .same(proto: "nodeAccountID"),
    3: .same(proto: "transactionFee"),
    4: .same(proto: "transactionValidDuration"),
    5: .same(proto: "memo"),
    6: .same(proto: "transfer"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._transactionID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.nodeAccountID) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.transactionFee) }()
      case 4: try { try decoder.decodeSingularInt64Field(value: &self.transactionValidDuration) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.memo) }()
      case 6: try {
        var v: TW_Hedera_Proto_TransferMessage?
        var hadOneofValue = false
        if let current = self.data {
          hadOneofValue = true
          if case .transfer(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.data = .transfer(v)
        }
      }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._transactionID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.nodeAccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.nodeAccountID, fieldNumber: 2)
    }
    if self.transactionFee != 0 {
      try visitor.visitSingularUInt64Field(value: self.transactionFee, fieldNumber: 3)
    }
    if self.transactionValidDuration != 0 {
      try visitor.visitSingularInt64Field(value: self.transactionValidDuration, fieldNumber: 4)
    }
    if !self.memo.isEmpty {
      try visitor.visitSingularStringField(value: self.memo, fieldNumber: 5)
    }
    try { if case .transfer(let v)? = self.data {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Hedera_Proto_TransactionBody, rhs: TW_Hedera_Proto_TransactionBody) -> Bool {
    if lhs._transactionID != rhs._transactionID {return false}
    if lhs.nodeAccountID != rhs.nodeAccountID {return false}
    if lhs.transactionFee != rhs.transactionFee {return false}
    if lhs.transactionValidDuration != rhs.transactionValidDuration {return false}
    if lhs.memo != rhs.memo {return false}
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Hedera_Proto_SigningInput: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningInput"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .standard(proto: "private_key"),
    2: .same(proto: "body"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.privateKey) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._body) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.privateKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.privateKey, fieldNumber: 1)
    }
    try { if let v = self._body {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Hedera_Proto_SigningInput, rhs: TW_Hedera_Proto_SigningInput) -> Bool {
    if lhs.privateKey != rhs.privateKey {return false}
    if lhs._body != rhs._body {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Hedera_Proto_SigningOutput: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningOutput"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .same(proto: "encoded"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.encoded) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.encoded.isEmpty {
      try visitor.visitSingularBytesField(value: self.encoded, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Hedera_Proto_SigningOutput, rhs: TW_Hedera_Proto_SigningOutput) -> Bool {
    if lhs.encoded != rhs.encoded {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
