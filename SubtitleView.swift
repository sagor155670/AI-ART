//
//  SubtitleView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 20/9/23.
//

import SwiftUI

struct SubtitleView: View {
    @State var isShowingRowDetails = false
    @ObservedObject var data: DataModel
    var folder: String
    var title: String
    var body: some View {
        HStack {
            
            Text(title)
                .fontDesign(.serif)
                .font(.system(size: 15))
                .frame(maxWidth: 230,alignment: .leading)
//                .padding(10)
            
            NavigationLink(destination: ImageRowDetailsView(isShowingRowDetails: $isShowingRowDetails, data: data, folder: folder)){
                HStack {
                    Text("See All")
                        .fontDesign(.serif)
                        .font(.system(size: 15))
                        .foregroundColor(.blue)
                        .bold()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.blue)
                        .bold()

                }.padding(.leading,30)
               
            }
            
            
//            Button(
//                action: {self.isShowingRowDetails.toggle()})
//            {
//                HStack {
//                    Text("See All")
//                        .fontDesign(.serif)
//                        .foregroundColor(.blue)
//                        .bold()
//                    Image(systemName: "chevron.right")
//                        .bold()
//                }.padding(.leading,30)
//            }.fullScreenCover(isPresented: $isShowingRowDetails){
//                ImageRowDetailsView(isShowingRowDetails: $isShowingRowDetails)
//            }
        }

    }
}

struct SubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleView(data: DataModel(), folder: "StyleGANEX", title: "Cinematic")
    }
}
