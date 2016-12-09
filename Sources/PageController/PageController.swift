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

    func createView() -> String
}
