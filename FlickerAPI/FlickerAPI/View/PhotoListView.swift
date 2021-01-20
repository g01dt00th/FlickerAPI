//
//  PhotoListView.swift
//  FlickerAPI
//
//  Created by  g01dt00th on 21.01.2021.
//

import SwiftUI

struct PhotoListView: View {
    @EnvironmentObject var vm: FlickrAPIViewModel
    @State private var selection: PhotoModel?
    
    var body: some View {
        if #available(iOS 14.0, *) {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(vm.photos) { photo in
                        PhotoView(photo: photo)
                            .padding()
                            .onAppear{
                                if photo.id == vm.photos[vm.photos.count - 10].id {
                                    vm.currentPage += 1
                                }
                            }
                            .onTapGesture {
                                selection = photo
                            }
                        NavigationLink(
                            destination: PhotoDetailView(photo: selection),
                            tag: photo,
                            selection: $selection,
                            label: {EmptyView()})
                        
                    }
                }
            }
        } else {
            List(vm.photos, id: \.id) { photo in
                PhotoView(photo: photo)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .padding(.vertical, 10)
                    .onAppear{
                        if photo.id == vm.photos[vm.photos.count - 10].id {
                            vm.currentPage += 1
                        }
                    }
                    .onTapGesture {
                        selection = photo
                    }
                NavigationLink(
                    destination: PhotoDetailView(photo: selection),
                    tag: photo,
                    selection: $selection,
                    label: {EmptyView()})
            }
        }
        
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView().environmentObject(FlickrAPIViewModel())
    }
}
