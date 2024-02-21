//
//  APIService.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkService {
    
    static let shared = NetworkService()

    private init() {}
    
    func request<T: Mappable>(baseAPI: APIFactory, responseType: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
    
        let paramData = baseAPI.parameters
        let param = paramData.toDictionary(paramData)
        let url = baseAPI.baseURL.appendingPathComponent(baseAPI.path)
        
        AF.request(url, method: baseAPI.method, parameters: param, headers: baseAPI.headers)
        .responseString { response in
            switch response.result {
            case .success(let data):
                let model = Mapper<T>().map(JSONString: data)
                if let modelResponse = model {
                    completion(.success(modelResponse))
                } else {
                    completion(.failure(APIError.failedMappingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
