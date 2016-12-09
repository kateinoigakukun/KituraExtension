//
//  PageController.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation
import Kitura

protocol PageController {
    associatedtype Routing: RouteMapping

    init(mappnig: Routing)

    var viewName: String { get }
    var context: [String: Any] {get}
}

extension PageController {
    var viewName: String {
        let className =  String(describing: type(of: self))
        let viewName = className.replacingOccurrences(of: "Controller", with: "")
        return viewName.lowercased()
    }
}
