//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Shaheer Ahmed on 8/18/22.
//

import SwiftUI

struct DetailScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("ChaatMasala")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(40)
                
                DescriptionView()
                    .offset(y:-40)
                    .foregroundColor(.pink)
            }
            
            .edgesIgnoringSafeArea(.top)
            
            HStack{
                Text("$2.99")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}, label:{
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(Color.pink)
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color.pink)
            .cornerRadius(75)
            .frame(maxHeight:.infinity,alignment:.bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(action:{presentationMode.wrappedValue.dismiss()}),trailing:Image("threeDot"))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
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
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            
                Text("Salt, Red Chili, Paprika, Corander, Cinnamon, Ginger ,Aniseed, Long Pepper, Cumin, Green Cardamom, Black Pepper, Dried Mango Powder, Aniseed, Long Pepper, Cumin, Green Cardamom, Black Pepper, Dried Mango Powder,Aniseed, Long Pepper, Cumin, Green Cardamom, Black Pepper, Dried Mango Powder")
            
                .lineSpacing(3.0)
                .opacity(0.6)
            
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    Text("Size")
                        .fontWeight(.semibold)
                    Text("Weight: 100 Grams / 3.52oz")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment:.leading)
                
                VStack(alignment: .leading){
                    Text("Use Cases")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    
                    Text("Perfect for Chaat and Corn!")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity,alignment:.leading)
            }
            .padding(.vertical)
            
            HStack(alignment:.bottom){
                VStack{
                    Text("Sizes")
                        .fontWeight(.semibold)
                    
                    VStack(alignment:.leading){
                        HStack{
                        SizeDotView(color:.blue)
                            Text("1 Pack")
                        }
                        HStack{
                        SizeDotView(color:.black)
                            Text("6 Pack")
                        }
                        HStack{
                            SizeDotView(color:.pink)
                            Text("12 Pack")
                    }
                    }
                }
                Spacer()
                
                VStack{
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                    Button(action:{}){
                        Image(systemName: "minus")
                            .padding(.all,8)
                    }
                    .frame(width:30, height:30)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal,8)
                    Button(action:{}){
                        Image(systemName: "plus")
                            .padding(.all,8)
                    }
                    //.frame(width:30, height:30)
                    //.overlay(RoundedRectangle(cornerRadius: 50).stroke())
                    .background(Color.pink)
                    .clipShape(Circle())
                    .foregroundColor(.black)
                    }}
            }
            Spacer()
                .padding(.bottom,50)
        }
            .padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(40.0)
        Spacer()
        
    }
}

struct SizeDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24, alignment: .center)
    }
}

	

struct BackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action:action, label:{
            Image(systemName: "chevron.backwards").padding(.all,12).background(Color.white).cornerRadius(8.0).foregroundColor(.black)
        }
        )
    }
}
