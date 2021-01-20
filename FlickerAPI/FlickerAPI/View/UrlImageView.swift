//
//  UrlImageView.swift
//  FlickerAPI
//
//  Created by  g01dt00th on 20.01.2021.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        if let image = urlImageModel.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            ActivityView()
        }
    }
    
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: "https://live.staticflickr.com/65535/50849373113_c2251a7a4d_w.jpg")
        
        UrlImageView(urlString: nil)
    }
}
