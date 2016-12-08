//
//  MappingFormat.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation

class MappingFormat {

    var pattern: [MappingValue] = []

    init(first: String, second: String) {

        self.pattern.append(contentsOf: [.string(first), .string(second)])
    }

    init(first: String, second: MappingValue) {
        self.pattern.append(.string(first))
        self.pattern.append(second)
    }

    init(first: MappingValue, second: String) {
        self.pattern.append(first)
        self.pattern.append(.string(second))
    }

    init(first: MappingValue, second: MappingValue) {
        self.pattern.append(first)
        self.pattern.append(second)
    }


    func add(_ value: MappingValue) {
        self.pattern.append(value)
    }

    func `is`(_ url: URL) -> Bool {
        return self.is(pathComponent: url.pathComponents)
    }

    func `is`(pathComponent: [String]) -> Bool {
        var pathComponent = pathComponent
        pathComponent.remove(at: 0)

        return zip(pattern, pathComponent).filter(!==).isEmpty
    }

    func match(_ url: URL) -> [MatchedType] {
        return self.match(pathComponent: url.pathComponents)
    }

    func match(pathComponent: [String]) -> [MatchedType] {
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
    var description: String {
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
