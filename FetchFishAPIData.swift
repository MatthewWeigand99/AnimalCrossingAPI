//
//  FetchFishAPIData.swift
//  AnimalCrossingAPI
//
//  Created by Matthew Weigand on 10/24/22.
//

import Foundation

class FetchFishAPIData: ObservableObject {
    var id: Int = -1
    var name: String = ""
    var icon_uri: String = ""
    var price: Int = -1
    var price_cj: Int = -1
    
    var fishID: Int = -1
    
    func fetchNewFish(fishID: Int) -> Void {
        fetchFishAPIData(completionHandler: {(FishData) in
            self.id = FishData.id
            self.name = FishData.name
            self.icon_uri = FishData.icon_uri
            self.price = FishData.price
            self.price_cj = FishData.price_cj

        }, fishID: fishID)
    }
    
    func fetchFishAPIData( completionHandler: @escaping (FishModel) -> Void, fishID: Int){
        let url = URL(string: "https://acnhapi.com/v1/fish/" + String(fishID))!
        var task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                let FishData = try JSONDecoder().decode(FishModel.self, from: data)
                completionHandler(FishData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}
