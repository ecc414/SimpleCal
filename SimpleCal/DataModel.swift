//
//  DataModel.swift
//  SimpleCal
//
//  Created by 엄철찬 on 2022/03/30.
//

//
//  Model.swift
//  SimpleCalculator
//
//  Created by 엄철찬 on 2022/02/14.
//

import Foundation

struct DataModel : Codable {
    var input  : String
    var output : String
    var comment : String
}


class Histroy {
    static var shared = Histroy()
    var history = [DataModel]()
    
    private init(){
        history = historyLoad()
    }
    
    private func historyLoad() -> [DataModel]{
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
    
    func historySave(){//_ input : [DataModel]){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            // Encode Note
            //let data = try encoder.encode(input)
            let data = try encoder.encode(history)
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "notes")
            // UserDefaults.standard.synchronize()
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    func textSave(_ input : String, at index : IndexPath){
        history[index.row].comment = input
        historySave()
    }
    
}

