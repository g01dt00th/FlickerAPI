//
//  ContentView.swift
//  FlickerAPI
//
//  Created by Роенко Денис on 19.01.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: FlickrAPIViewModel
    
    var body: some View {
        NavigationView {
            
            if vm.photos.isEmpty {
                ActivityView()
                    .padding()
            } else {
                PhotoListView()
                    .navigationBarTitle("mainViewTitleKey")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["en", "ru"], id: \.self) { lang in
                    ContentView()
                        .environment(\.locale, .init(identifier: lang))
                        .environmentObject(FlickrAPIViewModel())
                }
    }
}
