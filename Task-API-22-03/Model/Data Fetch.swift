//
//  Data Fetch.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
//

import Foundation
import SwiftUI




class Network{
    
    
    struct ApiError{
        var apiErrorS:String = ""
    }

    func getRawData(_ url: String, completion: @escaping ([User]? ,ApiError?) -> ()) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                
                print("-------URL ERROR--------")
                print(error.localizedDescription)
                
                completion(nil,.init(apiErrorS: "URL ERROR") )
                
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
        
                completion(nil, .init(apiErrorS: "No Response"))
                
                return
            }
            
            if response.statusCode == 200{
                
                guard let data = data else {

                    completion(nil, .init(apiErrorS: "Data Not Found"))
                    
                    return
                }
                
                DispatchQueue.main.async {
                    
                    do {
                        
                        let decodedRawData = try JSONDecoder().decode(RawData.self, from: data)
                        completion(decodedRawData.data, nil)
                        
                    } catch {
                        print("-------DECODE ERROR--------")
                        print("COULDNT DECODE")
                        print("---------------")
                        
                        completion(nil, .init(apiErrorS: " Couldnt Decode"))
                        
                    }
                    
                }
            }
            
        }
        task.resume()
        
    }
    
}
