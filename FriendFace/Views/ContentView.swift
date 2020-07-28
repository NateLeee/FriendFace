//
//  ContentView.swift
//  FriendFace
//
//  Created by Nate Lee on 7/27/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // @State private var users: [User] = []
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \User.name, ascending: true)
        ]
    ) var users: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(
                    // destination: UserView(allUsers: self.users, user: user)
                    destination: Text("Hello?")
                ) {
                    Text("\(user.name ?? "")")
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
            jsonDecoder.userInfo[CodingUserInfoKey.context!] = self.moc
            if let decoded = try? jsonDecoder.decode([User].self, from: data) {
                DispatchQueue.main.async {
                    // self.users = decoded
                    // Now it still tries to fetch data, but it just can't save them.
                    do {
                        try self.moc.save()
                    } catch let error {
                        print(error.localizedDescription)
                    }
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
