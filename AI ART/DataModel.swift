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
        
        
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_adv_Kpop", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "adv_Kpop"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Arcane_46", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Arcane_46"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Disney_v1.5", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Disney_v1.5"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Disney_v1.7", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Disney_v1.7"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Disney_v1.9", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Disney_v1.9"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Hayao_36", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Hayao_36"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Kpop", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Kpop"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_large_Kpop", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "large_Kpop"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_Arcane", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_Arcane"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_comic_99", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_comic_99"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_Comic", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_Comic"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_Nordic_myth1", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_Nordic_myth1"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_Nordic_myth2", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_Nordic_myth2"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_USA", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_USA"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_light_USA2", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "light_USA2"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Shinkai", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Shinkai"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_tiny_Arcane", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "tiny_Arcane"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_tiny_Comic", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "tiny_Comic"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_tiny_Nordic_myth1", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Nordic_myth1"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_tiny_Nordic_myth2", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "tiny_Nordic_myth2"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_tiny_USA", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "tiny_USA"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_tiny_USA2", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "tiny_USA2"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Trump_v1.5", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Trump_v1.5"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Trump_v1.6", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Trump_v1.6"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Trump_v1.7", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Trump_v1.7"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Trump_v1.8", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Trump_v1.8"),
        Item(beforeImage: "lady", afterImage: "AnimeGANv3_Trump_v1.9", title: "HolyLand", width: 120, height: 140, folder: "AnimeGANv3", isTF: true, style: "Trump_v1.9"),
        
        
        
    ]) {
        self.slider = slider
        self.isScaled = isScaled
        self.mockData = mockData
        self.folders = ["AnimeGANv3","StyleGANEX","VToonify_T","CartoonGan-tensorflow","DCT-Net","iNNfer"]
    }
    
    
    @Published  var slider:CGFloat = 1
    @Published  var isScaled:Bool = false
    @Published  var mockData: [Item]
    @Published  var folders: [String]
}
