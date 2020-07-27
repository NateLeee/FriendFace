//
//  FriendView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct FriendView: View {
    var friend: Friend
    var user: User
    
    var body: some View {
        VStack {
            Text("Friend Name: \(friend.name)")
            
            Text("Friend's UserID: \(user.name)")
        }
        .navigationBarTitle("\(friend.name)", displayMode: .inline)
    }
    
}
