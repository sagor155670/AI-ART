//
//  SettingView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 16/10/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var isShowingSetting:Bool
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue.opacity(0.1).ignoresSafeArea(edges: .bottom)
                VStack(alignment: .leading){
                    Text("General")
                        .frame(width: 100, height: 30, alignment: .bottom)
                       
                    ZStack(alignment: .topLeading){
                        Color.white
                            .frame(width: 350, height: 350, alignment: .top)
                            .cornerRadius(20)
                        VStack{
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image(systemName: "doc")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("Terms of use")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image(systemName: "questionmark.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("FAQ")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image(systemName: "checkmark.shield")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("Privacy Policy")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image(systemName: "envelope")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("Contact Us")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image(systemName: "star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("Rate Us")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("Restore Purchases")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                        }.frame(width: 250)
                    }
                    
                    Text("Follow Us")
                        .frame(width: 100, height: 30, alignment: .bottom)
                    ZStack(alignment: .leading){
                        Color.white.opacity(3)
                            .frame(width: 350, height: 150, alignment: .top)
                            .cornerRadius(20)
                        VStack{
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image("instagram")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 25)
                                    Text("Instagram")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            Link(destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/testflight/")!){
                                HStack{
                                    Image("tiktok")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 35)
                                    Text("Tiktok")
                                        .fontWeight(.medium)
                                        .fontDesign(.serif)
                                        .foregroundColor(Color.black)
                                }.frame(width: 200, height: 50,alignment: .leading)
                                
                            }
                            
                        }
                        .frame(width: 250)
                        
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.red, for: .navigationBar)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        isShowingSetting.toggle()
                    }label:{
                        Text("Close")
                            .fontWeight(.heavy)
                            .fontDesign(.serif)
                            
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
        
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isShowingSetting: .constant(true))
    }
}
