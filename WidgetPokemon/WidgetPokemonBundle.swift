//
//  WidgetPokemonBundle.swift
//  WidgetPokemon
//
//  Created by Sueda Beyza Özcan on 12.08.2024.
//

import WidgetKit
import SwiftUI

@main
struct WidgetPokemonBundle: WidgetBundle {
    var body: some Widget {
        WidgetPokemon()
        WidgetPokemonLiveActivity()
    }
}
