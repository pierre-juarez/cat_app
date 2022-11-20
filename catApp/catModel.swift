//
//  catModel.swift
//  catApp
//
//  Created by Pierre Juarez U. on 20/11/22.
//

import Foundation

struct catModel {
  
  let breedName: String
  let origin: String
  let affectionLevel: Int
  let intelligence: Int
  let imageUrl: String
  
  init(response: APIResponse){
    breedName = response.breedName
    origin = response.origin
    affectionLevel = response.affectionLevel
    intelligence = response.intelligence
    imageUrl = response.imageUrl
  }
  
}
