//
//  SplashScreen.swift
//  Checklist
//
//  Created by Anuj Khurana on 10/4/2023.
//

import SwiftUI

struct SplashScreenView: View {
    
//    loading page view
    var body: some View {
        VStack {
                VStack{
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 280)
                    Text("Checklists")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    ProgressView("Loading") //loading annimation
                    Spacer()
                    Text("Create by Anuj Khurana")
                        .font(.body)
                        .foregroundColor(.accentColor)
                }
        }
    }
}
