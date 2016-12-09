//
//  RouteMapping.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation

public protocol RouteMapping {
    static var format: MappingFormat {get}
    init(matched: [MatchedType], query: [String:String])
}
