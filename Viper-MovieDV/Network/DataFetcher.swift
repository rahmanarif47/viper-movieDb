//
//  DataFetcher.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation

enum MovieDBAPIError: Error {
    case badRequest
    case unauthorized
    case tooManyRequest
    case sercerError
}

extension MovieDBAPIError {
    var errorDescription : String {
        switch self {
        case .badRequest : return ""
        case .unauthorized : return  ""
        case .tooManyRequest : return ""
        case .sercerError : return ""
        }
    }
}

protocol DataFetcher {
    func getGenre(endpoint: Endpoint, completion: @escaping (Result<[Genre], MovieDBAPIError>) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func getGenre(endpoint: Endpoint, completion: @escaping (Result<[Genre], MovieDBAPIError>) -> Void) {
        service.request(endpoint: endpoint) { data, response, error in
            if let _ = error {
                completion(.failure(.badRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
            case 200:
                if let decode = self.decode(jsonData: genreRespone.self, from: data) {

                    completion(.success(decode.genres))
                }
            case 500:
                completion(.failure(.sercerError))
            default:
                break
            }
        }
    }
    
    private func decode<T: Decodable>(jsonData type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = data else { return nil }
        
        do {
            let response = try decoder.decode(type, from: data)
            return response
        } catch {
            print(error)
            return nil
        }
    }
}

