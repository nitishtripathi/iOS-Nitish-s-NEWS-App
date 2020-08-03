//
//  NetworkRequest.swift
//  pleaserun
//
//  Created by Nitish Tripathi on 03/08/20.
//  Copyright © 2020 Nitish Tripathi. All rights reserved.
//

import Foundation


enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}

//This is how we will access the response from the API.

//In here we need to configure all that we would like to access.

struct newsRequest {
    
var url: URL
    
let API_KEY = "Fj2CcjGwLkcXAAB0aliDoAflsjsfhXRW"
    
    init() {
    
        let destinationURL = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=\(API_KEY)"
        
        guard let url = URL(string: destinationURL) else {fatalError()}
        
        self.url = url
        
    }


     func getNews(completion: @escaping(Result<[Results], Error>) -> Void) {
           URLSession.shared.dataTask(with: url) { data, _, _ in
               guard let data = data else {
                   return
               }
               do{
                   let  wrapper = try JSONDecoder().decode(RootClass.self, from: data)
                   let news = wrapper.results
                   completion(.success(wrapper.results))
               }catch{
                   completion(.failure(error))
               }
           }.resume()
       }
}
