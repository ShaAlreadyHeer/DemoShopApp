//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            ZStack{
                Color(.lightGray)
                    .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("ChaatMasala")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
            
                DescriptionView()
            }
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}



struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Shan Chaat Masala")
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 4){
                ForEach(0 ..< 5){ item in
                    Image("star")
                }
                
                Text("4.9")
                    .opacity(0.5)
                    .padding(.leading,8)
                Spacer()
            }
            
            .padding()
            .padding(.top)
            .background(Color.white)
            .cornerRadius(40.0)
        }
    }
}
