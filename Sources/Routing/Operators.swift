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


infix operator / : Base
infix operator == : Base

func ==(lhs: MappingValue, rls: String) -> Bool {
    switch lhs {
    case .string(let string):
        return string == rls
    case .intType:
        return Int(rls) != nil
    case .stringType:
        return true
    }
}

func !==(lhs: MappingValue, rls: String) -> Bool {
    return !(lhs == rls)
}

func /(rhs: String, lhs: Int.Type) -> MappingFormat {
    return MappingFormat(first: rhs, second: .intType)
}

func /(rhs: String, lhs: String.Type) -> MappingFormat {
    return MappingFormat(first: rhs, second: .stringType)
}


func /(rhs: MappingFormat, lhs: String) -> MappingFormat {
    rhs.add(.string(lhs))
    return rhs
}

func /(rhs: MappingFormat, lhs: String.Type) -> MappingFormat {
    rhs.add(.stringType)
    return rhs
}

func /(rhs: MappingFormat, lhs: Int.Type) -> MappingFormat {
    rhs.add(.intType)
    return rhs
}

func /(rhs: String.Type, lhs: Int.Type) -> MappingFormat {
    return MappingFormat(first: .stringType, second: .intType)
}

func /(rhs: String.Type, lhs: String) -> MappingFormat {
    return MappingFormat(first: .stringType, second: .string(lhs))
}

func /(rhs: Int.Type, lhs: Int.Type) -> MappingFormat {
    return MappingFormat(first: .intType, second: .intType)
}
func /(rhs: String.Type, lhs: String.Type) -> MappingFormat {
    return MappingFormat(first: .stringType, second: .stringType)
}

func /(rhs: Int.Type, lhs: String) -> MappingFormat {
    return MappingFormat(first: .intType, second: .string(lhs))
}

func /(rhs: Int.Type, lhs: String.Type) -> MappingFormat {
    return MappingFormat(first: .intType, second: .stringType)
}
