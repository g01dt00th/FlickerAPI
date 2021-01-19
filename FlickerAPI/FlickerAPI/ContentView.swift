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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
