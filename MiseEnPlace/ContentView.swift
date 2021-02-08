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
            roundedRectangleView().overlay(HStack{
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .cornerRadius(10))
            
            roundedRectangleView().overlay(HStack{
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                SecureField("Password", text: $password)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .cornerRadius(10))
            
        
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct roundedRectangleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray)
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
            .overlay(HStack{
                
            })
    }
}
