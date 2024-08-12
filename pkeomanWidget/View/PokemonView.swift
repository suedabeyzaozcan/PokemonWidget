//
//  PokemonView.swift
//  pkeomanWidget
//
//  Created by Sueda Beyza Özcan on 12.08.2024.
//

import SwiftUI

struct PokemonView: View {
    let pokemon : pokemon
    var body: some View {
        HStack {
            Spacer()
            OzelGorselView(image: Image(pokemon.gorselIsmi)).frame(width: 150, height: 150,alignment: .center).padding()
            
            VStack{
                Text(pokemon.isim).font(.largeTitle).bold()
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.orange, .yellow],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                Text(pokemon.tur).fontWeight(.bold).foregroundStyle(
                    .linearGradient(
                        colors: [.indigo, .cyan],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            Spacer()
        }.frame(width: UIScreen.main.bounds.width,alignment: .center)
    }
}

#Preview {
    PokemonView(pokemon: pikachu)
}
