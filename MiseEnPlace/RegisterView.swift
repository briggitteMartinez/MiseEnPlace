//
//  RegisterView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-08.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State var remail = ""
    @State var rpassword = ""
    //@State var rpassword2 = ""
    var body: some View {
        VStack{
            Spacer()
            Image("miseenplacelogo").resizable().scaledToFit().frame(width: 200, height: 200, alignment: .center)
            Spacer()
            RoundedRectangleView().overlay(HStack{
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Email", text: $remail)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .cornerRadius(10))
            
            RoundedRectangleView().overlay(HStack{
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                SecureField("Password", text: $rpassword)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .cornerRadius(10))
            .padding(10)
            
//            RoundedRectangleView().overlay(HStack{
//                Image(systemName: "lock")
//                    .foregroundColor(.gray)
//                SecureField("Confirm password", text: $rpassword2)
//            }.frame(height: 60)
//            .padding(.horizontal, 20)
//            .cornerRadius(10))
//            .padding(10)
            
            Button(action: {
                //if rpassword == rpassword2{
                    Auth.auth().createUser(withEmail: remail, password: rpassword) { authResult, error in
                        if let e = error{
                            print(e)
                        }else{
                            print("registered user")
                            // code here to navigate to Homeview
                        }
                        
                    }
                    
                //}
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                    .frame(width: 180, height: 50)
                    .overlay(Text("Register").accentColor(.white))
            }.padding(.top, 20)
            Spacer()
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
