//
//  PhotoDetailView.swift
//  FlickerAPI
//
//  Created by  g01dt00th on 21.01.2021.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: PhotoModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            PhotoView(photo: photo)
                .padding()
            Divider()
            Text(photo?.description ?? "")
                .bold()
                .lineLimit(10)
                .lineSpacing(10.0)
                .padding()
            Spacer()
        }.navigationBarTitle("detailsViewTitleKey")
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView()
    }
}
