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
            Image("miseenplacelogo").resizable().scaledToFit().frame(width: 200, height: 200, alignment: .center).padding(.top, 20)
            Spacer()
            Text("Welcome, this is a place to easily store all of your delicious recipes").font(.largeTitle).foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40)).multilineTextAlignment(.center)
            Spacer()
//            HStack {
//                VStack {
//                    Image(systemName: "book")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 110, height: 110, alignment: .center)
//                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
//                    Text("Recipes").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40)).font(.title).padding(.all, -15)
//                }
//                Spacer()
//
//                VStack {
//                    Image(systemName: "doc.plaintext")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 110, height: 110, alignment: .center)
//                        .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
//                    Text("To Do").accentColor(Color(red: 0.00, green: 0.38, blue: 0.40)).font(.title).padding(.all, -12)
//                }
//            }.padding(45)
//            Spacer()
//            Spacer()
//
        }
    }
}

struct Home2View_Previews: PreviewProvider {
    static var previews: some View {
        Home2View()
    }
}

