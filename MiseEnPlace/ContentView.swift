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
        
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray)
                    .frame(width: 300, height: 50)
                    .background(Color(red: 0.00, green: 0.38, blue: 0.40))
                    .overlay(Text("Login").accentColor(.white))
            }
            
            HStack {
                Button(action: {}) {
                    Text("Sign Up")
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 30))
                Button(action: {}) {
                    Text("Forgot password?")
                }.padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
            }.padding(.bottom, 40)
           
        
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

