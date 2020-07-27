//
//  UserView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Age: \(user.age)")
                    
                    Text("Username: \(user.name)")
                    
                    Text("Company: \(user.company)")
                }
                
                Spacer()
            }
            .padding([.horizontal, .vertical])
            
            List(user.friends) { friend in
                Text("\(friend.name)")
            }
        }
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
}
