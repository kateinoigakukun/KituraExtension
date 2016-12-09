//
//  MatchedType.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation

public enum MatchedType {
    case string(String)
    case int(Int)

    var value: Any {
        switch self {
        case .int(let i):
            return i
        case .string(let s):
            return s
        }
    }
    func result<T>() -> T {
        guard let result = self.value as? T else {
            fatalError("\(self) is not \(T.self)")
        }
        return result
    }
}
