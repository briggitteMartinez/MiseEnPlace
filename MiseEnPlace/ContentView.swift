//
//  ContentView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-03.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            Spacer()
            Image("miseenplacelogo")
            Spacer()
            RoundedRectangleView().overlay(HStack{
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .cornerRadius(10))
            
            RoundedRectangleView().overlay(HStack{
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                SecureField("Password", text: $password)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .cornerRadius(10))
            .padding(10)
            
            Button(action: {
                print("Login succes")
            }) { RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    .frame(width: 180, height: 50)
                    .overlay(Text("Login").accentColor(.white))
            }
            
            HStack {
                Button(action: {}) {
                    Text("Sign up /")
                        .accentColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                }.padding(EdgeInsets(top: 10, leading: 6, bottom: 20, trailing: 0))
                Button(action: {}) {
                    Text("Forgot password?")
                        .accentColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
            }.padding(.bottom, 40)
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

