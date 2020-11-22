//
//  TokenAddingInterceptor.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import Foundation
import Apollo

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        // TODO
        let userAccount = UserDefaults.standard
        if let token =  userAccount.string(forKey: "sessionToken"){
            request.addHeader(name: "x-token", value: token)
        }
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}


