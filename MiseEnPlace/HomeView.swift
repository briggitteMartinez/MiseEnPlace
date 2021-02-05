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
               Text("Home Screen")
                   .tabItem {
                       Image(systemName: "house.fill")
                       Text("Home")
               }
               Text("Recipe Screen")
                   .tabItem {
                       Image(systemName: "book.fill")
                       Text("Recipes")
               }
               Text("To Do Screen")
                   .tabItem {
                       Image(systemName: "doc.plaintext.fill")
                       Text("ToDo")
               }
           }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}