//
//  Router+RouteMapping.swift
//  KituraExtension
//
//  Created by SaitoYuta on 2016/12/08.
//
//

import Foundation
import Kitura

public extension Router {
    public func get<T: RouteMapping>(_ routing: T.Type,
             handler: @escaping (T, RouterResponse, @escaping () -> Void) throws -> Void) {

        self.get(routing.format.description) { request, response, next in
            if !routing.format.is(request.urlComponents.url!) { return }
            let parameters = routing.format.match(request.urlComponents.url!)
            let query = request.queryParameters
            let result = routing.init(matched: parameters, query: query)

            try handler(result, response, next)
        }
    }
}
