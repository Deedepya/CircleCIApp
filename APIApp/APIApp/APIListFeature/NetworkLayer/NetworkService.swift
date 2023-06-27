//
//  NetworkService.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 07/06/23.
//

import Foundation

struct NetworkService {
    
    func getRequestApi(urlStr: String, completion: @escaping (Result<PublicAPIModel, Error>) -> Void) {
    
        guard let url = URL(string: urlStr) else {
            return
        }

        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            if let err = err  {
                completion(.failure(err))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //let dataParse = 
                let parsedData = try JSONDecoder().decode(PublicAPIModel.self, from: data)
                completion(.success(parsedData))
            } catch let error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
