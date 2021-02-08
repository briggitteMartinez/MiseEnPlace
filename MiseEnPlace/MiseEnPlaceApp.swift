//
//  MiseEnPlaceApp.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-03.
//

import SwiftUI
import Firebase

@main
struct MiseEnPlaceApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
