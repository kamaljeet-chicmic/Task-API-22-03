//
//  ContentView.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
//

import SwiftUI

//struct someView{
//    
//    var show2: Bool = false
//    
//    func toggleThis() -> View{
//        
//        return EmptyView()
//    }
//    
//
//}

struct ContentView: View {
    
    
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isApiCorrect : Bool = true
    
    var body: some View {
        
        NavigationStack{
            
            
            
            if userViewModel.appError != nil{
                
                    VStack{
                        
                        AlertView(error: $userViewModel.appError, isApiCorrect: $isApiCorrect)
                        
                    }
            
            }
            
            else{
                
                if userViewModel.users.count != 0{
                    
                    List() {
                        
                        ForEach(userViewModel.users,id: \.id){
                            user in
                            NavigationLink(destination:UserDetailView(user: user),label: {
                                UserListView(user: user)
                            })
                        }
                        
                        Button {
                            isApiCorrect.toggle()
                            print("button tapped")
                        } label: {
                            Text("Change Api")
                        }
                        

                        
                    }
                    .navigationTitle("User List")
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                else{
                    ProgressView()
                }
            }
        }
        .onAppear{
            print("appear")
            
            if isApiCorrect{
                
                userViewModel.getUsers(Constants.ApiEndpoints().correctApi)
            }
            else{
                userViewModel.getUsers(Constants.ApiEndpoints().correctApi)
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
    }
}


