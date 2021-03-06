//
//  FlickrAPIViewModel.swift
//  FlickerAPI
//
//  Created by Роенко Денис on 19.01.2021.
//

import SwiftUI

final class FlickrAPIViewModel: ObservableObject {
    @Published var data: FlickrAPIModel?
    @Published var currentPage = 1 {
        didSet {
            fetchListFromCurrentPage()
        }
    }
    
    @Published var photos = [PhotoModel]()
    
    
    private let urlSession: URLSession = {
        let cache = URLCache(memoryCapacity: 10_485_760, diskCapacity: 52_428_800)

        let configuration = URLSessionConfiguration.default
        configuration.urlCache = cache
        configuration.networkServiceType = .default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = TimeInterval(5)
        configuration.timeoutIntervalForResource = TimeInterval(5)
        configuration.waitsForConnectivity = true

        let session = URLSession(configuration: configuration)
        return session
    }()

    
    init() {
        fetchListFromCurrentPage()
    }
    
    func fetchListFromCurrentPage() {
        let urlString = "https://www.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=47eb0bcaa201593b054a714e28a4ece6&format=json&nojsoncallback=1&page=\(currentPage)"
        
        guard  let url = URL(string: urlString) else { return }
        
        urlSession.dataTask(with: url, completionHandler: { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                print("No data loaded")
                return
            }
            let decoder = JSONDecoder()
            do {
                let jsonData = try decoder.decode(FlickrAPIModel.self, from: data)
                DispatchQueue.main.async {
                    self.data = jsonData
                    self.prepareData()
                }

            } catch {
                print(error.localizedDescription)
            }
        }).resume()
        

    }
    
    func prepareData() {
        data?.photos.photo.forEach { photo in
            let url = self.convertURL(server_id: photo.server, id: photo.id, secret: photo.secret)
            let descrition = photo.title
            self.photos.append(PhotoModel(url: url, description: descrition))
            
        }
    }
    
    
    private func convertURL(server_id: String, id: String, secret: String) -> String {
        "https://live.staticflickr.com/\(server_id)/\(id)_\(secret)_n.jpg"
    }
}
