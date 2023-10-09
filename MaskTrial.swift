//
//  MaskTrial.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 24/9/23.
//

import SwiftUI

struct MaskTrial: View {
    
    @State var slider: Double = 0
    
    
    var body: some View {
        Image("001")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 400)
            .mask(
                HStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: slider * 300, height: 400)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 400)
                }
            )
            .onAppear {
                withAnimation(.easeIn(duration: 2)) {
                    slider = 1
                }
            }
    }
}

struct MaskTrial_Previews: PreviewProvider {
    static var previews: some View {
        MaskTrial()
    }
}
