//
//  UsersListView.swift
//  UsersList
//
//  Created by Nitin on 3/22/23.
//

import SwiftUI

struct UsersListView: View {
    
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataModel.results) { results in
                    
                    NavigationLink(destination: {
                        UserDetailView(results: results)
                    }, label: {
                        UserListTile(results: results)
                    })

                }
            }
            .navigationTitle("List of Employees")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            dataModel.loadData()
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
