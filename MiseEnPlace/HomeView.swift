//
//  HomeView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Home2View()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            NavigationView{
                RecipesView()
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Recipes")
            }
            Text("To Do Screen")
                .tabItem {
                    Image(systemName: "doc.plaintext.fill")
                    Text("ToDo")
                }
            SignOutView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Sign Out")
                }
        }.accentColor(Color(red: 0.00, green: 0.38, blue: 0.40))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
