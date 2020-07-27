//
//  ContentView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(
                    destination: UserView(allUsers: self.users, user: user)
                ) {
                    Text("\(user.name)")
                }
            }
            .navigationBarTitle("Friend Face")
        }
        .onAppear(perform: downloadJSON)
    }
    
    func downloadJSON() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                fatalError("URLSession.shared.dataTask error!")
            }
            guard let data = data else {
                fatalError("URLSession.shared.dataTask data is nil!")
            }
            
            let jsonDecoder = JSONDecoder()
            if let decoded = try? jsonDecoder.decode([User].self, from: data) {
                DispatchQueue.main.async {
                    self.users = decoded
                }
            }
        }.resume() // ALWAYS .resume()!!!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
