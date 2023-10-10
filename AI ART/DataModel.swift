    //
    //  DataModel.swift
    //  AI ART
    //
    //  Created by Saiful Islam Sagor on 26/9/23.
    //

import SwiftUI

class DataModel: ObservableObject {
    
    
    internal init(slider: CGFloat = 1, isScaled: Bool = false, mockData: [Item]  = [
        Item(beforeImage: "lady", afterImage: "StyleGANEX Pixar", title: "HolyLand", width: 120, height: 140, folder: "StyleGANEX", isTF: false, style:"pixar"),
        Item(beforeImage: "lady", afterImage: "StyleGANEX Arcane", title: "HolyLand", width: 120, height: 140, folder: "StyleGANEX", isTF: false, style: "arcane"),
        Item(beforeImage: "lady", afterImage: "StyleGANEX Cartoon", title: "HolyLand", width: 120, height: 140, folder: "StyleGANEX", isTF: false, style: "cartoon"),
        Item(beforeImage: "lady", afterImage: "VToonify_T Pixar", title: "HolyLand", width: 120, height: 140, folder: "VToonify_T", isTF: false, style:"pixar"),
        Item(beforeImage: "lady", afterImage: "StyleGANEX Pixar", title: "HolyLand", width: 120, height: 140, folder: "VToonify_T", isTF: false, style: "arcane"),
        Item(beforeImage: "lady", afterImage: "VToonify_T Cartoon", title: "HolyLand", width: 120, height: 140, folder: "VToonify_T", isTF: false, style: "cartoon"),
        Item(beforeImage: "lady", afterImage: "VToonify_T Caricature", title: "HolyLand", width: 120, height: 140, folder: "VToonify_T", isTF: false, style:"caricature"),
        Item(beforeImage: "lady", afterImage: "VToonify_T Comic", title: "HolyLand", width: 120, height: 140, folder: "VToonify_T", isTF: false, style: "comic"),
        Item(beforeImage: "lady", afterImage: "iNNfer WBC", title: "HolyLand", width: 120, height: 140, folder: "iNNfer", isTF: false, style: "WBC"),
        Item(beforeImage: "lady", afterImage: "animegan2-pytorch celeba_distill", title: "HolyLand", width: 120, height: 140, folder: "animegan2-pytorch", isTF: false, style: "celeba_distill"),
        Item(beforeImage: "lady", afterImage: "animegan2-pytorch face_paint_512_v1", title: "HolyLand", width: 120, height: 140, folder: "animegan2-pytorch", isTF: false, style: "face_paint_512_v1"),
        Item(beforeImage: "lady", afterImage: "animegan2-pytorch face_paint_512_v2", title: "HolyLand", width: 120, height: 140, folder: "animegan2-pytorch", isTF: false, style: "face_paint_512_v2"),
        Item(beforeImage: "lady", afterImage: "animegan2-pytorch paprika", title: "HolyLand", width: 120, height: 140, folder: "animegan2-pytorch", isTF: false, style: "paprika"),
        Item(beforeImage: "lady", afterImage: "CartoonGan Shinkai", title: "HolyLand", width: 120, height: 140, folder: "CartoonGan-tensorflow", isTF: true, style: "shinkai"),
        Item(beforeImage: "lady", afterImage: "CartoonGan Paprika", title: "HolyLand", width: 120, height: 140, folder: "CartoonGan-tensorflow", isTF: true, style: "paprika"),
        Item(beforeImage: "lady", afterImage: "DCT-Net anime", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "anime"),
        Item(beforeImage: "lady", afterImage: "DCT-Net 3d", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "3d"),
        Item(beforeImage: "lady", afterImage: "DCT-Net handdrawn", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "handdrawn"),
        Item(beforeImage: "lady", afterImage: "DCT-Net sketch", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "sketch"),
        Item(beforeImage: "lady", afterImage: "DCT-Net artstyle", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "artstyle"),
        Item(beforeImage: "lady", afterImage: "DCT-Net sd-design", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "sd-design"),
        Item(beforeImage: "lady", afterImage: "DCT-Net sd-illustration", title: "HolyLand", width: 120, height: 140, folder: "DCT-Net", isTF: true, style: "sd-illustration"),
        
    ]) {
        self.slider = slider
        self.isScaled = isScaled
        self.mockData = mockData
        self.folders = ["StyleGANEX","VToonify_T","CartoonGan-tensorflow","DCT-Net","iNNfer"]
    }
    
    
    @Published  var slider:CGFloat = 1
    @Published  var isScaled:Bool = false
    @Published  var mockData: [Item]
    @Published  var folders: [String]
}
