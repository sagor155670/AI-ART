//
//  ModelHandler.swift
//  AI ART
//
//  Created by Saiful Islam Sagor on 11/10/23.
//

import Foundation
import SwiftUI

import CoreML


class Cartoonizer {
    
    let modelName:String
    let config:MLModelConfiguration
    
    init(modelName: String) {
        self.config = MLModelConfiguration()
        self.config.computeUnits = .cpuAndNeuralEngine
        self.modelName = modelName
    }
    

    
    func inference(image: UIImage)-> UIImage {
        
        let ratio = image.size.height/image.size.width

        let processedImage = image.pixelBuffer(width: 1024, height: 1024)

        let modelName = self.modelName
        
        
        switch modelName {
        case "AnimeGANv3_adv_Kpop":
            let model = try! AnimeGANv3_adv_Kpop(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Disney_v1.5":
            let model = try! AnimeGANv3_Disney_v1_5(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Trump_v1.6":
            let model = try! AnimeGANv3_Trump_v1_6(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Trump_v1.7":
            let model = try! AnimeGANv3_Trump_v1_7(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_USA":
            let model = try! AnimeGANv3_light_USA(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Arcane_46":
            let model = try! AnimeGANv3_Arcane_46(configuration: config)
            let pixelBuffer = try! model.prediction(animeganv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Trump_v1.5":
            let model = try! AnimeGANv3_Trump_v1_5(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_Comic":
            let model = try! AnimeGANv3_light_Comic(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_Trump_v1.9":
            let model = try! AnimeGANv3_light_Trump_v1_9(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_tiny_Comic":
            let model = try! AnimeGANv3_tiny_Comic(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Disney_v1.7":
            let model = try! AnimeGANv3_Disney_v1_7(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_tiny_USA2":
            let model = try! AnimeGANv3_tiny_USA2(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Hayao_36":
            let model = try! AnimeGANv3_Hayao_36(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_comic_99":
            let model = try! AnimeGANv3_light_comic_99(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_Arcane":
            let model = try! AnimeGANv3_light_Arcane(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_USA2":
            let model = try! AnimeGANv3_light_USA2(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Trump_v1.8":
            let model = try! AnimeGANv3_Trump_v1_8(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_tiny_Nordic_myth1":
            let model = try! AnimeGANv3_tiny_Nordic_myth1(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_Nordic_myth1":
            let model = try! AnimeGANv3_light_Nordic_myth1(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Shinkai":
            let model = try! AnimeGANv3_Shinkai(configuration: config)
            let pixelBuffer = try! model.prediction(input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_tiny_Nordic_myth2":
            let model = try! AnimeGANv3_tiny_Nordic_myth2(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_large_Kpop":
            let model = try! AnimeGANv3_large_Kpop(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_tiny_Arcane":
            let model = try! AnimeGANv3_tiny_Arcane(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Kpop":
            let model = try! AnimeGANv3_Kpop(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_tiny_USA":
            let model = try! AnimeGANv3_tiny_USA(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_Disney_v1.9":
            let model = try! AnimeGANv3_Disney_v1_9(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        case "AnimeGANv3_light_Nordic_myth2":
            let model = try! AnimeGANv3_light_Nordic_myth2(configuration: config)
            let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
            return UIImage(pixelBuffer: pixelBuffer)!.resized(to: CGSize(width: 1024, height: 1024*ratio))
        default:
            print("\(modelName) is not a valid Model")
            return image
            
        }
        
//        let model = try! AnimeGANv3_light_Nordic_myth2(configuration: config)
//        let pixelBuffer = try! model.prediction(AnimeGANv3_input: processedImage!).image
        
        
    }

}
