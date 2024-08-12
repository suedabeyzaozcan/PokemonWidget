import WidgetKit
import SwiftUI
import Intents

struct Provider: AppIntentTimelineProvider {
    @AppStorage("pokemon", store: UserDefaults(suiteName: "grup.com.sueda.pokemonWidget"))
    var pokemonData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), pokemon: pokemon(gorselIsmi: "avatar", isim: "Pikachu", tur: "Mouse Pokemon"))
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        if let pokemon = try? JSONDecoder().decode(pokemon.self, from: pokemonData) {
            return SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
        } else {
            return placeholder(in: context)
        }
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let entry: SimpleEntry
        if let pokemon = try? JSONDecoder().decode(pokemon.self, from: pokemonData) {
            entry = SimpleEntry(date: Date(), configuration: configuration, pokemon: pokemon)
        } else {
            entry = placeholder(in: context)
        }
        return Timeline(entries: [entry], policy: .never)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let pokemon: pokemon
}

struct WidgetPokemonEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            OzelGorselView(image: Image(entry.pokemon.gorselIsmi))
            Text(entry.pokemon.isim)
                .font(.headline)
            Text(entry.pokemon.tur)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Time:")
            Text(entry.date, style: .time)
            Text("Favorite Emoji:")
            Text(entry.configuration.favoriteEmoji)
        }
    }
}

struct WidgetPokemon: Widget {
    let kind: String = "WidgetPokemon"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WidgetPokemonEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WidgetPokemon()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley, pokemon: pokemon(gorselIsmi: "avatar", isim: "Pikachu", tur: "Mouse Pokemon"))
    SimpleEntry(date: .now, configuration: .starEyes, pokemon: pokemon(gorselIsmi: "avatar", isim: "Pikachu", tur: "Mouse Pokemon"))
}
