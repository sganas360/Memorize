//
//  ContentView.swift
//  Memorize
//
//  Created by Shun Ganas on 9/21/22.
//

import SwiftUI

struct ContentView: View {
   var vehicleEmojis = ["✈️", "🚅", "🚌", "🚗","🚀","🚙","⛵️","🛵","🚢","🚎","🛴"]
   let animalEmojis = ["🐕" ,"🦌" ,"🦝" ,"🦥" ,"🦔" ,"🐁"]
   let plantEmojis = ["🌵" ,"🎄" ,"🌳" ,"🌴" ,"💐" ,"🌻", "🌹", "🍄"]
   @State var emojis: [String]
   @State var emojiCount = 5
    var body: some View {
        VStack{
            ScrollView{
               Text("Memorize!")
                  .font(.largeTitle)
                  .foregroundColor(Color.black)
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                       CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack{
               Spacer()
               vehicles
               Spacer()
               animals
               Spacer()
               plants
               Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
   
   init(){
      emojis = vehicleEmojis
   }
    
   var vehicles: some View {
      VStack{
         Button{
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4...vehicleEmojis.count)
         } label: {
            Image(systemName: "car")
         }
         Text("Vehicles")
            .font(.footnote)
            .foregroundColor(Color.blue)
      }
   }
   
   var plants: some View {
      VStack{
         Button{
            emojis = plantEmojis.shuffled()
            emojiCount = Int.random(in: 4...plantEmojis.count)
         } label: {
            Image(systemName: "leaf")
         }
         Text("Plants")
            .font(.footnote)
            .foregroundColor(Color.blue)
      }
   }
   
   var animals: some View {
      VStack{
         Button{
            emojis = animalEmojis.shuffled()
            emojiCount = Int.random(in: 4...animalEmojis.count)
         } label: {
            Image(systemName: "pawprint")
         }
         Text("Animals")
            .font(.footnote)
            .foregroundColor(Color.blue)
      }
   }

   
   
    var remove: some View {
            Button {
                if emojiCount < emojis.count{
                    emojiCount += 1
                }
            } label: {
                Image(systemName: "plus.circle")
                
            }
        }
        
    var add: some View {
            Button {
                if emojiCount > 1  {
                    emojiCount -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }
        }
    }
    
    struct CardView: View {
        @State var isFaceUp: Bool = false
        var content: String
        
        var body: some View{
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content)
                        .font(.largeTitle)
                }
                else {
                    shape.fill()
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
