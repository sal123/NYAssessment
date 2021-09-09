//
//  AppDelegate.swift
//  ISTestProject
//
//  Created by Umer Maqsood on 6/25/21.
//

import UIKit

class APIService: NSObject {
    let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/"

    func apiToGetItems( completion : @escaping (ItemListModel) -> ()){
        guard let serviceUrl = URL(string:"\(baseURL)all-sections/1.json?api-key=1M5UcazGR79AiTC0esh7A8y4JWLBswBE") else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(ItemListModel.self, from: data)
                    completion(empData)
            }
            
        }.resume()
    }
    
}
