//
//  DataModel.swift
//  UsersList
//
//  Created by Himanshu on 3/22/23.
//
//change from hriday
import Foundation

class DataModel: ObservableObject {
    
    @Published var results = [UsersModel]()
    
    func loadData() {
        
        guard let url = URL(string: "https://reqres.in/api/users/") else {
            print("Invalid Url")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(ResponseModel.self, from: data) {
                    self.results = response.data
                }
            }
        }.resume()
    }
    
}
