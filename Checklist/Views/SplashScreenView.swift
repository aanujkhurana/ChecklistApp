//
//  SplashScreen.swift
//  Checklist
//
//  Created by Anuj Khurana on 10/4/2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isActive: Bool = false
    @State var model: DataModel = DataModel()
    
    var body: some View {
        VStack {
            if self.isActive {
                ChecklistsView(model: $model)
            }
            else {
                VStack{
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 280)
                    Text("Checklists")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    ProgressView("Loading")
                    Spacer()
                    Text("Create by Anuj Khurana")
                        .font(.body)
                        .foregroundColor(.accentColor)
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
