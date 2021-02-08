//
//  RoundedRectangleView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-08.
//

import Foundation
import SwiftUI

struct RoundedRectangleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray)
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
            
    }
}

