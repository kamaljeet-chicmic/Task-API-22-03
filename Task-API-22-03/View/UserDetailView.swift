//
//  UserDetailView.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: User
    
    var body: some View {
        VStack(alignment:.center){
            
            Image("bgimage")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 250)
                .fixedSize()
                
            
            AsyncImage(url: URL(string: user.avatar)){
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            }placeholder: {
                Image(systemName: "person.fill")
                    
                    
            }.frame(width:200,height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white,lineWidth: 5))
                .offset(y:-105)
                .shadow(radius: 30)
            Spacer()
            
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(id: 1, email: "some@some.com", firstName: "something", lastName: "something", avatar: "https://reqres.in/img/faces/1-image.jpg"))
    }
}
