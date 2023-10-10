//
//  TestView.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 2/10/23.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var data:DataModel
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var isIncreasing = true
    @State var isShowing:Bool = false
    var body: some View {
        
       VStack{
           
           ImageRowView(data: data, folder: "StyleGANEX")
           ImageRowView(data: data, folder: "animegan2-pytorch")
           Button{
               isShowing.toggle()
           }label: {
               Text("show sheet")
           }
        }.onReceive(timer){_ in
            DispatchQueue.main.async {
                if isIncreasing{
                    if data.slider >= 1.0{
                        isIncreasing = false
                    }
                    data.slider += 0.005
                }
                else{
                    if data.slider <= 0.0{
                        isIncreasing = true
                    }
                    data.slider -= 0.005
                }
            }
        }
        .sheet(isPresented: $isShowing){
            PhotoPickerModalView( isShowingPhotoPicker: $isShowing, jsonData: JsonData(folder: "", style: ""), urlString: "")
                .presentationDetents([.fraction(0.25)])
                .presentationBackground(Color.clear)
        }
        
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(data: DataModel())
    }
}

struct ModelCard: Identifiable {
    let id = UUID()
    let title: String
    let image: UIImage
    let folder: String
    let isTF: Bool
    let style: String
    let url: String
    
    init(title: String, folder: String, isTF: Bool, style: String) {
        self.title = title
        self.folder = folder
        self.image = UIImage(imageLiteralResourceName: self.title)
        self.isTF = isTF
        self.style = style
        self.url = isTF ? "http://103.4.146.170:8001/api/cartoonify/" : "http://103.4.146.170:8002/api/cartoonify/"
    }
}

var cards = [
        ModelCard(title: "StyleGANEX Pixar", folder: "StyleGANEX", isTF: false, style:"pixar"),
        ModelCard(title: "StyleGANEX Arcane", folder: "StyleGANEX", isTF: false, style: "arcane"),
        ModelCard(title: "StyleGANEX Cartoon", folder: "StyleGANEX", isTF: false, style: "cartoon"),
        ModelCard(title: "VToonify_T Pixar", folder: "VToonify_T", isTF: false, style:"pixar"),
        ModelCard(title: "VToonify_T Arcane", folder: "VToonify_T", isTF: false, style: "arcane"),
        ModelCard(title: "VToonify_T Cartoon", folder: "VToonify_T", isTF: false, style: "cartoon"),
        ModelCard(title: "VToonify_T Caricature", folder: "VToonify_T", isTF: false, style:"caricature"),
        ModelCard(title: "VToonify_T Comic", folder: "VToonify_T", isTF: false, style: "comic"),
        ModelCard(title: "White Box Cartoonization", folder: "iNNfer", isTF: false, style: "WBC"),
        ModelCard(title: "animegan2 celeba_distill", folder: "animegan2-pytorch", isTF: false, style: "celeba_distill"),
        ModelCard(title: "animegan2 face_paint_512_v1", folder: "animegan2-pytorch", isTF: false, style: "face_paint_512_v1"),
        ModelCard(title: "animegan2 face_paint_512_v2", folder: "animegan2-pytorch", isTF: false, style: "face_paint_512_v2"),
        ModelCard(title: "animegan2 paprika", folder: "animegan2-pytorch", isTF: false, style: "paprika"),
        ModelCard(title: "CartoonGan Shinkai", folder: "CartoonGan-tensorflow", isTF: true, style: "shinkai"),
        ModelCard(title: "CartoonGan Paprika", folder: "CartoonGan-tensorflow", isTF: true, style: "paprika"),
        ModelCard(title: "DCT-Net anime", folder: "DCT-Net", isTF: true, style: "anime"),
        ModelCard(title: "DCT-Net 3d", folder: "DCT-Net", isTF: true, style: "3d"),
        ModelCard(title: "DCT-Net handdrawn", folder: "DCT-Net", isTF: true, style: "handdrawn"),
        ModelCard(title: "DCT-Net sketch", folder: "DCT-Net", isTF: true, style: "sketch"),
        ModelCard(title: "DCT-Net artstyle", folder: "DCT-Net", isTF: true, style: "artstyle"),
        ModelCard(title: "DCT-Net sd-design", folder: "DCT-Net", isTF: true, style: "sd-design"),
        ModelCard(title: "DCT-Net sd-illustration", folder: "DCT-Net", isTF: true, style: "sd-illustration"),
    ]
