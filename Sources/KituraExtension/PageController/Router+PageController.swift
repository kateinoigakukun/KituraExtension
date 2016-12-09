//
//  Router+PageController.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/09.
//
//

import Foundation
import Kitura

public extension Router {
    public func get<T: PageController>(controller: T.Type) {

        self.get(T.Routing.self) { result, response, next in

            response.status(.OK)
            let controller = controller.init(mappnig: result)
            try response.render(controller.viewName, context: controller.context).end()
        }
    }
}
