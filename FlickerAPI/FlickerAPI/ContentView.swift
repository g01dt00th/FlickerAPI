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
            VStack {
                Text("Hello, world!")
                    .padding()
            }.navigationBarTitle("mainViewTitleKey")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["en", "ru"], id: \.self) { lang in
                    ContentView()
                        .environment(\.locale, .init(identifier: lang)) // а ведь раньше работало, эх... такую классную фичу сломали
                        .environmentObject(FlickrAPIViewModel())
                }
    }
}
