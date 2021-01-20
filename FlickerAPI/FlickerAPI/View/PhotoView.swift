//
//  PhotoView.swift
//  FlickerAPI
//
//  Created by Роенко Денис on 20.01.2021.
//

import SwiftUI

struct PhotoView: View {
    var img: PhotoModel?
    
    var body: some View {
        if let img = img {
            UrlImageView(urlString: img.url)
        } else {
            Image(systemName: "lasso.sparkles")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 160)
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
