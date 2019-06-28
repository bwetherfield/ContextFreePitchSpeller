import Foundation
import PitchSpeller

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let filepath = getDocumentsDirectory().appendingPathComponent("pitched_weights.json")

let decoder = JSONDecoder()

do {
    let data = try Data(contentsOf: filepath)
    let lookupTable = try decoder.decode([PitchSpeller.SpellingInverter.PitchedEdge: Double].self, from: data)
    print(lookupTable)
} catch let error {
    print(error.localizedDescription)
}


