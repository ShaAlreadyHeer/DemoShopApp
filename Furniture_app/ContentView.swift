//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    private let categories = ["All","Spices","Dairy","Naan","Fruit & Veggies"]
    var body: some View {
        ZStack{
            Color(.lightGray)
                .edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading){
                AppBarView()
                TagLineView()
                    .padding()
                SearchBarView()
                
                HStack{
                    ForEach(0 ..< categories.count) { i in
                        //If Index == 1 then isActive is true
                    CategoryView(isActive: i == 1, text: categories[i])
                    }
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

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(.white)
                    .cornerRadius(10.0)
            }
            Spacer()
            Button(action:{}){
                Image(uiImage: #imageLiteral(resourceName: "ShaheerProfile"))
                    .resizable()
                    .frame(width:42, height:42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular",size:28))
            .foregroundColor(Color("Primary"))
        + Text("Deals!")
            .font(.custom("PlayfairDisplay-Bold",size:28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchBarView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing,8)
                TextField("Search Deals",text:$search)
            }
            
            .padding(.all,20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action:{}) {
                Image("Scan")
                    .resizable()
                    .frame(width: 35, height: 30)
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 0){
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Primary"))
                
                if(isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }
}
