//
//  ContentView.swift
//  catApp
//
//  Created by Pierre Juarez on 20/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack{
        
        Text("Cat App")
          .font(.system(size: 25))
          .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
          .bold()
        
        ScrollView{
          VStack(){
            cardCat()
            cardCat()
            cardCat()
          }
          
        }
        
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct cardCat: View {
  var body: some View {
    
    ZStack{
      VStack {
        
        HStack{
          Text("Gato")
          Text("Américano")
        }
        
        AsyncImage(
            url: URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 100)
            },
            placeholder: {
                ProgressView()
            }
        )

 /***
        Image(systemName: "global")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 200)
          .foregroundColor(.accentColor)
 **/
        
        HStack{
          Text("Nivel de Afecto: 100%")
          Text("Inteligencia: 100%")
        }
        
          
      }.padding(.all)
        .border(.black)
    }.frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
    
   
      
    
    
    
  }
}
