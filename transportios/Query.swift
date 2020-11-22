//
//  Query.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import Foundation

class QueryController{
    init(){
        Network.shared.apollo.fetch(query: StopsQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
     
      
     
    
}
