//
//  UserDetailView.swift
//  UsersList
//
//  Created by Himanshu on 3/22/23.
//

import SwiftUI

struct UserDetailView: View {
    
    @State var results: UsersModel?
    
    var body: some View {
        VStack {
            if let res = results {
                AsyncImage(url: URL(string: res.avatar))
                    .frame(width: 124, height: 124)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(100)

                Text(res.first_name + " " + res.last_name)
                    .font(.largeTitle)
                
                Text(res.email)
                    .font(.subheadline)
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
