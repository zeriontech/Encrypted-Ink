// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Theta.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

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

//// Input data necessary to create a signed transaction
public struct TW_Theta_Proto_SigningInput {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  //// Chain ID string, mainnet, testnet and privatenet
  public var chainID: String = String()

  //// Recipient address
  public var toAddress: String = String()

  //// Theta token amount to send in wei (uint256, serialized big endian)
  public var thetaAmount: Data = Data()

  //// TFuel token amount to send in wei (uint256, serialized big endian)
  public var tfuelAmount: Data = Data()

  //// Sequence number of the transaction for the sender address
  public var sequence: UInt64 = 0

  //// Fee amount in TFuel wei for the transaction (uint256, serialized big endian)
  public var fee: Data = Data()

  //// The secret private key used for signing (32 bytes).
  public var privateKey: Data = Data()

  //// Public key
  public var publicKey: Data = Data()

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Result containing the signed and encoded transaction.
public struct TW_Theta_Proto_SigningOutput {
  // VSwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the VSwiftProtobuf library for
  // methods supported on all messages.

  //// Signed and encoded transaction bytes
  public var encoded: Data = Data()

  //// Signature
  public var signature: Data = Data()

  /// error code, 0 is ok, other codes will be treated as errors
  public var error: TW_Common_Proto_SigningError = .ok

  /// error code description
  public var errorMessage: String = String()

  public var unknownFields = VSwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the VSwiftProtobuf runtime.

fileprivate let _protobuf_package = "TW.Theta.Proto"

extension TW_Theta_Proto_SigningInput: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningInput"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .standard(proto: "chain_id"),
    2: .standard(proto: "to_address"),
    3: .standard(proto: "theta_amount"),
    4: .standard(proto: "tfuel_amount"),
    5: .same(proto: "sequence"),
    6: .same(proto: "fee"),
    7: .standard(proto: "private_key"),
    8: .standard(proto: "public_key"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.chainID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.toAddress) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.thetaAmount) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.tfuelAmount) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.sequence) }()
      case 6: try { try decoder.decodeSingularBytesField(value: &self.fee) }()
      case 7: try { try decoder.decodeSingularBytesField(value: &self.privateKey) }()
      case 8: try { try decoder.decodeSingularBytesField(value: &self.publicKey) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.chainID.isEmpty {
      try visitor.visitSingularStringField(value: self.chainID, fieldNumber: 1)
    }
    if !self.toAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.toAddress, fieldNumber: 2)
    }
    if !self.thetaAmount.isEmpty {
      try visitor.visitSingularBytesField(value: self.thetaAmount, fieldNumber: 3)
    }
    if !self.tfuelAmount.isEmpty {
      try visitor.visitSingularBytesField(value: self.tfuelAmount, fieldNumber: 4)
    }
    if self.sequence != 0 {
      try visitor.visitSingularUInt64Field(value: self.sequence, fieldNumber: 5)
    }
    if !self.fee.isEmpty {
      try visitor.visitSingularBytesField(value: self.fee, fieldNumber: 6)
    }
    if !self.privateKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.privateKey, fieldNumber: 7)
    }
    if !self.publicKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.publicKey, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Theta_Proto_SigningInput, rhs: TW_Theta_Proto_SigningInput) -> Bool {
    if lhs.chainID != rhs.chainID {return false}
    if lhs.toAddress != rhs.toAddress {return false}
    if lhs.thetaAmount != rhs.thetaAmount {return false}
    if lhs.tfuelAmount != rhs.tfuelAmount {return false}
    if lhs.sequence != rhs.sequence {return false}
    if lhs.fee != rhs.fee {return false}
    if lhs.privateKey != rhs.privateKey {return false}
    if lhs.publicKey != rhs.publicKey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Theta_Proto_SigningOutput: VSwiftProtobuf.Message, VSwiftProtobuf._MessageImplementationBase, VSwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningOutput"
  public static let _protobuf_nameMap: VSwiftProtobuf._NameMap = [
    1: .same(proto: "encoded"),
    2: .same(proto: "signature"),
    3: .same(proto: "error"),
    4: .standard(proto: "error_message"),
  ]

  public mutating func decodeMessage<D: VSwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.encoded) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.signature) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.error) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.errorMessage) }()
      default: break
      }
    }
  }

  public func traverse<V: VSwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.encoded.isEmpty {
      try visitor.visitSingularBytesField(value: self.encoded, fieldNumber: 1)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularBytesField(value: self.signature, fieldNumber: 2)
    }
    if self.error != .ok {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 3)
    }
    if !self.errorMessage.isEmpty {
      try visitor.visitSingularStringField(value: self.errorMessage, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Theta_Proto_SigningOutput, rhs: TW_Theta_Proto_SigningOutput) -> Bool {
    if lhs.encoded != rhs.encoded {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs.error != rhs.error {return false}
    if lhs.errorMessage != rhs.errorMessage {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
