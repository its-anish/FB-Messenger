//
//  APIService.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import Foundation

class APIService: NSObject {
    private let BASEURL: String = "https://reqres.in/api/"
    
    func getUser(page: Int, completion : @escaping ([User]) -> ()) {
        let url = URL(string: "\(BASEURL)users?page=\(page)")!

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let pageData = try! jsonDecoder.decode(PageData.self, from: data)
                
                completion(pageData.users)
            }
        }.resume()
    }
}
