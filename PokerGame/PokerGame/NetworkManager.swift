//
//  NetworkManager.swift
//  PokerGame
//
//  Created by JK on 2020/03/30.
//  Copyright © 2020 codesquad. All rights reserved.
//

import Foundation

protocol NetworkManable {
    func getResource(from: String, handler: @escaping (Data?, Error?) -> ()) throws
}

enum NetworkErrorCase : Error {
    case InvalidURL
    case NotFound
}

struct NetworkManager {
    enum EndPoints {
        static let Players = "https://public.codesquad.kr/jk/PokerPlayer.json"
    }
        
    func getResource(from: String, handler: @escaping (Data?, Error?)->()) throws {
        guard let url = URL(string: from) else {
            throw NetworkErrorCase.InvalidURL
        }
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            handler(data, error)
        }.resume()
    }
}

struct MockNetworkSuccessStub: NetworkManable {
    func getResource(from: String, handler: @escaping (Data?, Error?) -> ()) throws {
        let data = "[ {\"name\": \"JK\"} ]".data(using: .utf8)
        handler(data, nil)
    }
}

struct MockNetworkFailureStub: NetworkManable {
    func getResource(from: String, handler: @escaping (Data?, Error?) -> ()) throws {
        handler(nil, NetworkErrorCase.NotFound)
    }
}

struct MockNetworkInvalidURLStub: NetworkManable {
    func getResource(from: String, handler: @escaping (Data?, Error?) -> ()) throws {
        throw NetworkErrorCase.InvalidURL
    }
}
