//
//  UserDetailView.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
//

import SwiftUI

struct UserListView: View {
    var user : User
    
    var body: some View {
        
    
        HStack(){
            
            AsyncImage(url: URL(string: user.avatar)){
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            }placeholder: {
                Image(systemName: "person.fill")
                    
            }.frame(width:60,height: 60)
                .shadow(color: .red, radius: 2)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black,lineWidth: 3.5))
                
      
            VStack(alignment: .leading){
                HStack{
                    Text(user.firstName)
                    Text(user.lastName)
                        .offset(x:-5)
                    Spacer()
                }
                
                Text(user.email)
                    .font(.caption)
            }
            Spacer()
            
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(user: User(id: 1, email: "some@some.com", firstName: "something", lastName: "something", avatar: "https://reqres.in/img/faces/1-image.jpg"))
    }
}
