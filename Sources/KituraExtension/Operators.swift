//
//  Operators.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation



precedencegroup Base {
    associativity: left
    lowerThan: AdditionPrecedence
}


infix operator / : MultiplicationPrecedence
infix operator == : Base

public func ==(lhs: MappingValue, rls: String) -> Bool {
    switch lhs {
    case .string(let string):
        return string == rls
    case .intType:
        return Int(rls) != nil
    case .stringType:
        return true
    }
}

public func !==(lhs: MappingValue, rls: String) -> Bool {
    return !(lhs == rls)
}

public func /(rhs: String, lhs: Int.Type) -> MappingFormat {
    return MappingFormat(first: rhs, second: .intType)
}

public func /(rhs: String, lhs: String.Type) -> MappingFormat {
    return MappingFormat(first: rhs, second: .stringType)
}


public func /(rhs: MappingFormat, lhs: String) -> MappingFormat {
    rhs.add(.string(lhs))
    return rhs
}

public func /(rhs: MappingFormat, lhs: String.Type) -> MappingFormat {
    rhs.add(.stringType)
    return rhs
}

public func /(rhs: MappingFormat, lhs: Int.Type) -> MappingFormat {
    rhs.add(.intType)
    return rhs
}

public func /(rhs: String.Type, lhs: Int.Type) -> MappingFormat {
    return MappingFormat(first: .stringType, second: .intType)
}

public func /(rhs: String.Type, lhs: String) -> MappingFormat {
    return MappingFormat(first: .stringType, second: .string(lhs))
}

public func /(rhs: Int.Type, lhs: Int.Type) -> MappingFormat {
    return MappingFormat(first: .intType, second: .intType)
}
public func /(rhs: String.Type, lhs: String.Type) -> MappingFormat {
    return MappingFormat(first: .stringType, second: .stringType)
}

public func /(rhs: Int.Type, lhs: String) -> MappingFormat {
    return MappingFormat(first: .intType, second: .string(lhs))
}

public func /(rhs: Int.Type, lhs: String.Type) -> MappingFormat {
    return MappingFormat(first: .intType, second: .stringType)
}
