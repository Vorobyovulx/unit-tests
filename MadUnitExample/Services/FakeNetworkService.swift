//
//  FakeNetworkService.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import Foundation

struct FakeNetworkService {

    func search(_ term: String, completion: @escaping (Result<[Track], Error>) -> Void) {
        URLSession.shared.dataTask(with: .search(term: term)) { data, _, error in
            DispatchQueue.main.async {
                completion(self.parse(data: data, error: error))
            }
        }
        .resume()
    }

    func parse(data: Data?, error: Error?) -> Result<[Track], Error> {
        if let data = data {
            return Result { try JSONDecoder().decode(SearchMediaResponse.self, from: data).results }
        } else {
            return .failure(error ?? URLError(.badServerResponse))
        }
    }

}




protocol HTTPClient {

    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)

}

class RealHTTPClient: HTTPClient {

    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                } else {
                    completion(.failure(error!))
                }
            }
        }
        .resume()
    }

}

class MockHTTPClient: HTTPClient {

    var inputRequest: URLRequest?
    var executeCalled = false
    var result: Result<Data, Error>?

    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        executeCalled = true
        inputRequest = request
        result.map(completion)
    }

}

struct FakeNetworkService {

    let httpClient: HTTPClient

    func search(_ term: String, completion: @escaping (Result<[Track], Error>) -> Void) {
        httpClient.execute(request: .search(term: term)) { result in
            completion(self.parse(result))
        }
    }

    private func parse(_ result: Result<Data, Error>) -> Result<[Track], Error> {
        switch result {
        case let .success(data):
            return Result { try JSONDecoder().decode(SearchMediaResponse.self, from: data).results }

        case let .failure(error):
            return .failure(error)
        }
    }

}

struct FakeNetworkServiceWithoutDependency {

    private let httpClient: HTTPClient = RealHTTPClient()

    func parse(data: Data?, error: Error?) -> Result<[Track], Error> {
        if let data = data {
            return Result { try JSONDecoder().decode(SearchMediaResponse.self, from: data).results }
        } else {
            return .failure(error!)
        }
    }

}
