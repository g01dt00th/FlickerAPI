//
//  ActivityView.swift
//  FlickerAPI
//
//  Created by  g01dt00th on 20.01.2021.
//

import SwiftUI

struct ActivityView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
