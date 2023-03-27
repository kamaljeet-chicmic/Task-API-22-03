//
//  File.swift
//  Task-API-22-03
//
//  Created by Paras  on 23/03/23.
//

import Foundation
import SwiftUI

struct AppError: Identifiable {
    var id = UUID().uuidString
    var errorString: String
}

final class UserViewModel: ObservableObject{
    
    
    
    private let network = Network()
    
    @Published var users: [User] = []
    @Published var appError: AppError? = nil
    @Published var show: Bool = true
    
//    func toggleValue()->  View{
//
//        show.toggle()
//
//        return EmptyView()
//    }
    
    
    
    func getUsers(_ url: String) {
        
        network.getRawData( url ) { (users,error) in
            
            if let error = error{
                
                self.appError = AppError(errorString: error.apiErrorS)
                
            }
            
            guard let user = users else{
                return
            }
            self.users = user
        }
        
    }
    
    
}
