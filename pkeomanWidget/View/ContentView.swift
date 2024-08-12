//
//  ContentView.swift
//  pkeomanWidget
//
//  Created by Sueda Beyza Özcan on 8.08.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("pokemon", store: UserDefaults(suiteName: "grup.com.sueda.pkeomanWidget"))
    var pokemonData : Data = Data()
    
    var body: some View {
        VStack{
            ForEach(pokemonDizisi){
                pokemon in PokemonView(pokemon: pokemon).onTapGesture(perform: { userDefaultsKaydet(pokemon: pokemon)
                })
            }
        }
    }
    func userDefaultsKaydet(pokemon: pokemon) {
        if let pokemonData = try?
            JSONEncoder().encode(pokemon){
            self.pokemonData = pokemonData
            print(pokemon.isim)
        }
        print (pokemon.isim)
    }
}

#Preview {
    ContentView()
}
