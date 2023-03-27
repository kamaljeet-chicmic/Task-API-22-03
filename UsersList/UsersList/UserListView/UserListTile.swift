//
//  UserListTile.swift
//  UsersList
//
//  Created by Nitin on 3/22/23.
//

import SwiftUI

struct UserListTile: View {
    
    @State var results: UsersModel?
    
    var body: some View {
        
        HStack {
            if let res = results {
                AsyncImage(url: URL(string: res.avatar))
                    .frame(width: 54, height: 54)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(100)
    
                VStack(alignment: .leading) {
                    Text(res.first_name + " " + res.last_name)
                        .font(.headline)
                    
                    Text(res.email)
                        .font(.subheadline)
                }
            }
        }
        
    }
}

struct UserListTile_Previews: PreviewProvider {
    static var previews: some View {
        UserListTile()
    }
}
