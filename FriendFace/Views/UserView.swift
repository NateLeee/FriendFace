//
//  UserView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct UserView: View {
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Age: \(user.age)")
                    
                    Text("Username: \(user.name ?? "")")
                    
                    Text("Company: \(user.company ?? "")")
                }
                
                Spacer()
            }
            .padding([.horizontal, .vertical])
            
            List(user.friendsArray, id: \.id) { friend in
                NavigationLink(
                    destination:
                    FriendView(user: self.findUser(by: friend.id!))
                ) {
                    Text("\(friend.name ?? "Unknown Name")")
                }
            }
        }
        .navigationBarTitle("\(user.name ?? "Unknown Name")", displayMode: .inline)
    }
    
    func findUser(by id: String) -> User {
        users.first { $0.id == id }!
    }
}
