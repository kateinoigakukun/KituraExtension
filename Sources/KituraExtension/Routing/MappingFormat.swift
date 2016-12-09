//
//  MappingFormat.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation

public class MappingFormat {
    
    public var pattern: [MappingValue] = []

    public init(first: String, second: String) {

        self.pattern.append(contentsOf: [.string(first), .string(second)])
    }

    public init(first: String, second: MappingValue) {
        self.pattern.append(.string(first))
        self.pattern.append(second)
    }

    public init(first: MappingValue, second: String) {
        self.pattern.append(first)
        self.pattern.append(.string(second))
    }

    public init(first: MappingValue, second: MappingValue) {
        self.pattern.append(first)
        self.pattern.append(second)
    }


    public func add(_ value: MappingValue) {
        self.pattern.append(value)
    }

    public func `is`(_ url: URL) -> Bool {
        return self.is(pathComponent: url.pathComponents)
    }

    public func `is`(pathComponent: [String]) -> Bool {
        var pathComponent = pathComponent
        pathComponent.remove(at: 0)

        return zip(pattern, pathComponent).filter(!==).isEmpty
    }

    public func match(_ url: URL) -> [MatchedType] {
        return self.match(pathComponent: url.pathComponents)
    }

    public func match(pathComponent: [String]) -> [MatchedType] {
        if !self.is(pathComponent: pathComponent) {
            return []
        }

        var pathComponent = pathComponent
        pathComponent.remove(at: 0)

        return zip(pattern, pathComponent)
            .flatMap { expect, actual in
                switch expect {
                case .string( _):
                    return nil
                case .intType( _):
                    return .int(Int(actual)!)
                case .stringType( _):
                    return .string(actual)
                }
        }
    }
}

extension MappingFormat: CustomStringConvertible {
    public var description: String {
        return self.pattern.enumerated().reduce("") {
            switch $1.element {
            case .intType, .stringType:
                return "\($0)/:value\($1.offset)"
            case .string(let str):
                return "\($0)/\(str)"
            }
        }
    }
}
