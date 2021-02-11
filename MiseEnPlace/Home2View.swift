//
//  Home2View.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-11.
//

import SwiftUI
import Firebase

struct Home2View: View {
    @State var goToLogin = false
    
    var body: some View {
        VStack{
            Image("miseenplacelogo").resizable().scaledToFit().frame(width: 200, height: 200, alignment: .center).padding(.top, 20)
            Spacer()
            HStack {
                VStack {
                    Image(systemName: "book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110, alignment: .center)
                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    Text("Recipes").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40)).font(.title).padding(.all, -15)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "doc.plaintext")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110, alignment: .center)
                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    Text("To Do").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40)).font(.title).padding(.all, -12)
                }
            }.padding(45)
            Spacer()
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
                                   .frame(width: 40, height: 100, alignment: .center)
                                   .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                               Text("Sign Out").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40)).font(.title).padding(.all, -25)
                           }
                       }.padding(.bottom, 30)
                       
           Spacer()
            .fullScreenCover(isPresented: $goToLogin, content: {
                ContentView()
            })

        }
    }
}

struct Home2View_Previews: PreviewProvider {
    static var previews: some View {
        Home2View()
    }
}
