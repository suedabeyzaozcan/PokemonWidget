//
//  pokemon.swift
//  pkeomanWidget
//
//  Created by Sueda Beyza Özcan on 12.08.2024.
//

import Foundation
struct pokemon : Identifiable, Codable {
    let gorselIsmi : String
    let isim : String
    let tur : String
    var id : String 
    
    {
        gorselIsmi
    }
}
let pikachu = pokemon(gorselIsmi: "avatar", isim: "Pikachu", tur: "Mouse Pokemon")
let snorlax = pokemon(gorselIsmi: "avatar-2", isim: "Snorlax", tur: "Normal Pokemon")
let meowth = pokemon(gorselIsmi: "avatar-3", isim: "Meowth", tur: "Cat Pokemon")

let pokemonDizisi = [pikachu, snorlax, meowth]
