//
//  PhotoView.swift
//  FlickerAPI
//
//  Created by Роенко Денис on 20.01.2021.
//

import SwiftUI

struct PhotoView: View {
    var photo: PhotoModel?
    
    var body: some View {

        
        UrlImageView(urlString: photo?.url)
            .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
            .cornerRadius(10, antialiased: true)
            .shadow(radius: 10)


    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
