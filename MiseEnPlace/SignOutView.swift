//
//  SignOutView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-11.
//

import SwiftUI
import Firebase

struct SignOutView: View {
    @State var goToLogin = false
    
    var body: some View {
        VStack{
            Image("miseenplacelogo").resizable().scaledToFit().frame(width: 250, height: 250, alignment: .center).padding(.top, 20)
            
            Spacer()
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    goToLogin.toggle()
                } catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
                }
                
            }) {
                VStack {
                    
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    Text("Sign Out").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40)).font(.title)
                }
            }.padding(.bottom, 30)
            Spacer()
            
            Text("Welcome back another time with some delicious recipes").font(.title).foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40)).multilineTextAlignment(.center)
            
            Spacer()
                .fullScreenCover(isPresented: $goToLogin, content: {
                    ContentView()
                })
        }
        
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
