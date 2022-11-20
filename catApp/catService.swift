//
//  catService.swift
//  catApp
//
//  Created by Pierre Juarez U. on 20/11/22.
//

import Foundation

public final class catService: NSObject {
  
  let API_KEY = "bda53789-d59e-46cd-9bc4-2936630fde39"
  var completionHandler : ((catModel) -> Void)?
  
  public override init() {
    super.init()
  }
  
  func loaderData(_ completionHandler: @escaping((catModel) -> Void) ){
    self.completionHandler = completionHandler
  }
  
  func getCats(){
    
    guard let urlString = "https://api.thecatapi.com/v1/breeds".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
    print("URL", urlString)
    guard let URL = URL(string: urlString) else { return }
    
    var request = URLRequest(url: URL)
    request.addValue("bda53789-d59e-46cd-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")
    request.httpMethod = "GET"
                         
    URLSession.shared.dataTask(with: request){ data, response, error in
      guard error == nil, let data = data else { return }
      
      if let response = try? JSONDecoder().decode(APIResponse.self, from: data){
        let cat = catModel(response: response)
        self.completionHandler?(cat)
      }
      
    }.resume()
  }
  

}

struct APIResponse: Decodable {
  
  let breedName: String
  let origin: String
  let affectionLevel: Int
  let intelligence: Int
  let imageUrl: String
  
}
