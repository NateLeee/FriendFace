//
//  UserView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct UserView: View {
    // var allUsers: [User]
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
            
//            List(user.friends, id: \.id) { friend in
//                NavigationLink(
//                    destination:
//                    // FriendView(user: self.findUser(by: friend.id))
//                    Text("\(friend.name ?? "")")
//                ) {
//                    Text("\(friend.name ?? "")")
//                }
//            }
        }
        .navigationBarTitle("\(user.name ?? "")", displayMode: .inline)
    }
    
//    func findUser(by id: String) -> User {
//        allUsers.first { $0.id == id }!
//    }
}
