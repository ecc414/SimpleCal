//
//  HistoryFunctions.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//

//
//  History.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/03/22.
//

import Foundation

class HistoryFunctions {
    static func historySave(_ input : [DataModel]){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            // Encode Note
            let data = try encoder.encode(input)
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "notes")
            // UserDefaults.standard.synchronize()
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    static func historyLoad() -> [DataModel]{
        if let data = UserDefaults.standard.data(forKey: "notes") {
            do {
                let decoder = JSONDecoder()                                     // Create JSON Decoder
                let notes = try decoder.decode([DataModel].self, from: data)    // Decode Note
                return notes
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        return [DataModel]()
    }
}

