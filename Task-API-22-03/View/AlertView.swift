//
//  AlertView.swift
//  Task-API-22-03
//
//  Created by Paras  on 24/03/23.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var error : AppError?
    @Binding var isApiCorrect : Bool
    @EnvironmentObject var userViewModel : UserViewModel
    
    var body: some View {
        
        VStack{
            
            
                Text("Something Went Wrong")
                    .padding()
                    .font(.title2)
                
                if let error1 = error?.errorString{
                    Text(error1)
                        .offset(y:20)
                }
                Button {
                    userViewModel.getUsers(Constants.ApiEndpoints().correctApi)
                } label: {
                    Text("Okay")
                }
                .padding()
            
            
        }
        
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView( error: .constant(AppError(errorString: "Error String")), isApiCorrect: .constant(true))
            .environmentObject(UserViewModel())
    }
}
