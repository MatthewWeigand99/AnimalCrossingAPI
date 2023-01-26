//
//  FetchAPIData.swift
//  AnimalCrossingAPI
//
//  Created by Matthew Weigand on 10/12/22.
//

import Foundation

class FetchVillagerAPIData: ObservableObject {
    var id: Int = -1
    var species: String = ""
    var birthday_string: String = ""
    var personality: String = ""
    var icon_uri: String = ""
    //var name: String = ""
    
    var villagerID: Int = -1

    /*init(){
        fetchVillagerAPIData(completionHandler: {(VillagerData) in
            self.id = VillagerData.id
            self.species = VillagerData.species
        }, villagerID: villagerID)
    }*/
    
    func fetchNewVillager(villagerID: Int) -> Void {
        fetchVillagerAPIData(completionHandler: {(VillagerData) in
            self.id = VillagerData.id
            self.species = VillagerData.species
            self.personality = VillagerData.personality
            self.birthday_string = VillagerData.birthday_string
            self.icon_uri = VillagerData.icon_uri
            //self.name = VillagerData.name

        }, villagerID: villagerID)
    }
    
    func fetchVillagerAPIData( completionHandler: @escaping (VillagerModel) -> Void, villagerID: Int){
        let url = URL(string: "https://acnhapi.com/v1/villagers/" + String(villagerID))!
        var task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                let VillagerData = try JSONDecoder().decode(VillagerModel.self, from: data)
                completionHandler(VillagerData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}
