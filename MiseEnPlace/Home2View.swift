//
//  Home2View.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-11.
//

import SwiftUI
import Firebase

struct Home2View: View {
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack {
                VStack {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130, alignment: .center)
                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    Text("Recipes").font(.title).padding(.all, -15)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "doc.plaintext")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130, alignment: .center)
                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    Text("To Do").font(.title).padding(.all, -12)
                }
            }.padding(35)
            Spacer()
            Button(action: {
                let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            }
                
            }) {
                VStack {

                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130, alignment: .center)
                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    Text("Sign Out").font(.title).padding(.all, -5)
                }
            }.padding(.bottom, 30)
            
Spacer()
        }
    }
}

struct Home2View_Previews: PreviewProvider {
    static var previews: some View {
        Home2View()
    }
}
