//
//  ContentView.swift
//  GeoReader
//
//  Created by Todd Hamilton on 8/15/21.
//

import SwiftUI

struct ContentView: View {

    let games = ["cuphead","fez","botw","meatboy","firewatch","limbo","goosegame","braid","hollowknight"]

    var body: some View {

        ZStack {
            Color.black
            AngularGradient(gradient: Gradient(colors: [.red, .blue, .purple, .orange]), center: .center)
                .blur(radius: 100)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:-24){
                    ForEach(games, id: \.self) { game in
                        GeometryReader { geometry in
                            ZStack{
                                Image(game)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:240,height:320)
                                    .cornerRadius(4)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                Rectangle()
                                    .fill(Color.white.opacity(0.14))
                                    .frame(width:240,height:320)
                                    .cornerRadius(4)
                                    .offset(x: geometry.frame(in: .global).minX - 240)
                                    .clipped()
                            }
                            .frame(width:240,height:320)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 24) / 12), axis: (x: 0.0, y: -1.0, z: 0.0))
                            
                        }
                        .frame(width:240,height:320)
                    }
                    .padding(24)
                }
                .padding()
            }
            .frame(width:UIScreen.main.bounds.width, height:320)
        }.ignoresSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
