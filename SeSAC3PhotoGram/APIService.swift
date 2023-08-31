//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/30.
//

import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    func request() {
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {return}

            let value = String(data: data!, encoding: .utf8)

            print(data)
            print(response)
            print(error)
        }.resume()
    }

}
