//
//  catViewModel.swift
//  catApp
//
//  Created by Pierre Juarez U. on 20/11/22.
//

import Foundation

class catViewModel: ObservableObject {
  
  @Published var breedName: String = "Breed Name"
  @Published var origin: String = "Origin"
  @Published var affectionLevel: String = "100%"
  @Published var intelligence: String = "100%"
  @Published var imgUrl: String = "https://image.com/url.jpg"

  
  public let CatService: catService
  
  init(CatService: catService){
    self.CatService = CatService
  }
  
  func refresh(){
    
    CatService.loaderData{ cat in
      DispatchQueue.main.async {
        self.breedName = cat.breedName
        self.origin = cat.origin
        self.affectionLevel = "\(cat.affectionLevel)%"
        self.intelligence = "\(cat.intelligence)%"
        self.imgUrl = cat.imageUrl
      }
      
    }
  }
  
}
