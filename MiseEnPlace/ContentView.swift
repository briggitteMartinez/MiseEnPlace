//
//  ContentView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-03.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State var goToHome = false
    
    var body: some View {
        NavigationView{
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
                    Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                        if let e = error{
                            print(e)
                        }else{
                            print("Login Succes")
                            goToHome.toggle()
                            //navigate to homeview
                            //
                        }
                        
                    }
                    
                    // ...
                }) { RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    .frame(width: 180, height: 50)
                    .overlay(Text("Sign in").accentColor(.white))
                }
                
                HStack {
                    NavigationLink(
                        destination: RegisterView(),
                        label: {
                            Text("Sign up /").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                        }).padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                    
                    
                    Button(action: {}) {
                        Text("Forgot password?")
                            .accentColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                }.padding(.bottom, 40)
                
                
            }.fullScreenCover(isPresented: $goToHome, content: {
                HomeView()
            })
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

