//
//  NetworkManager.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/31.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchWebImage(
        query: String,
        completion: @escaping (WebImageContainer) -> ()
    ) {
        let urlString = "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(APIKey.unsplashAccess)"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            guard error == nil else {return}

            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode)
            else {return}

            guard let data = data else {return}

            do {
                let webImageContainer = try JSONDecoder().decode(WebImageContainer.self, from: data)
                completion(webImageContainer)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
