//
//  FriendView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct FriendView: View {
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    Text("Friend Name: \(user.name ?? "")")
                    
                    Text("Friend's UserID: \(user.id ?? "")")
                    
                    Text("User's Age: \(user.age)")
                    
                    Text("User's Company: \(user.company ?? "")")
                    
                    Divider()
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("\(user.name ?? "")", displayMode: .inline)
    }
    
}
