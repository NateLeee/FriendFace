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
            Text("\(user.age)")
            
            Text("\(user.name)")
            
            Text("\(user.company)")
        }
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
}

