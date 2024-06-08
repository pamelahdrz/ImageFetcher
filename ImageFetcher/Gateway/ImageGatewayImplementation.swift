//
//  ImageGatewayImplementation.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import Foundation
import Alamofire

class ImageGatewayImplementation: ImageGateway {
    let endpointServer = "https://jsonplaceholder.typicode.com/photos"
    func fetchImageResponse(completionHandler: @escaping (Alamofire.AFDataResponse<[Images]>) -> ()) {
        AF.request(endpointServer, method: .get)
            .validate()
            .responseDecodable(of: [Images].self) { (response : AFDataResponse<[Images]>) in
                completionHandler(response)
                
                guard let statusCode = response.response?.statusCode else { return }
                
                guard let responseData = response.data else {
                    print("Error: \(statusCode)")
                    return
                }
                
                let strData = String(data: responseData, encoding: .utf8)
                print("-----------Response Starts:--------------")
                print("----------------------------------------------------")
                print("-----------------StatusCode: \(statusCode)--------------------")
                print("\(strData ?? "")")
                print("----------------------------------------------------")
                print("------------Response Ends:---------------")
            }
    }
}
