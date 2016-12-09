//
//  Router+PageController.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/09.
//
//

import Foundation
import Kitura

extension Router {
    func get<T: PageController>(controller: T) {

//        let routing = T.Routing
        
        self.get(routing.format.description) { request, response, next in
            if !routing.format.is(request.urlComponents.url!) { return }
            let parameters = routing.format.match(request.urlComponents.url!)
            let query = request.queryParameters
            let result = routing.init(matched: parameters, query: query)
//            controller.init(mapping: result)
        }
    }
}
