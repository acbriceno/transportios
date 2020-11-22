//
//  Network.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import Foundation
import Apollo
class Network {
  static let shared = Network()
  
  private(set) lazy var apollo: ApolloClient = {
      // The cache is necessary to set up the store, which we're going to hand to the provider
      let cache = InMemoryNormalizedCache()
      let store = ApolloStore(cache: cache)
      
      let client = URLSessionClient()
    let provider = NetworkInterceptorProvider(client: client, store: store)
      let url = URL(string: "http://192.168.2.212:5002/")!

      let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                               endpointURL: url)
                                                               

      // Remember to give the store you already created to the client so it
      // doesn't create one on its own
      return ApolloClient(networkTransport: requestChainTransport,
                          store: store)
  }()
    
}

