//
//  PostView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-08.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Recipe Name Here").font(.title2)
            Image("rotfrukter").resizable().scaledToFit()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
