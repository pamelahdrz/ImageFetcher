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
    
    func fetchImageResponse() async throws -> [Images] {
        let response = await AF.request(endpointServer, method: .get)
                               .validate()
                               .serializingDecodable([Images].self)
                               .response
        
        guard let statusCode = response.response?.statusCode, let responseData = response.data else {
            print("Error: nil Data")
            return []
        }
        
        let strData = String(data: responseData, encoding: .utf8)
        print("-----------Response Starts:-------------------------")
        print("----------------------------------------------------")
        print("-----------------StatusCode: \(statusCode)--------------------")
        print("\(strData ?? "")")
        print("----------------------------------------------------")
        print("------------Response Ends:--------------------------")
        
        guard let responseValue = response.value else {
            print("Error: \(String(describing: response.error))")
            return []
        }
        
        return responseValue
    }
}
