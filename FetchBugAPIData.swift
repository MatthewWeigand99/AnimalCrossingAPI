//
//  FetchBugAPIData.swift
//  AnimalCrossingAPI
//
//  Created by Matthew Weigand on 10/13/22.
//

import Foundation

class FetchBugAPIData: ObservableObject {
    var id: Int = -1
    var icon_uri: String = ""
    var price: Int = -1
    var price_flick: Int = -1
    
    var bugID: Int = -1
    
    func fetchNewBug(bugID: Int) -> Void {
        fetchBugAPIData(completionHandler: {(BugData) in
            self.id = BugData.id
            self.icon_uri = BugData.icon_uri
            self.price = BugData.price
            self.price_flick = BugData.price_flick
            
        }, bugID: bugID)
    }
    
    func fetchBugAPIData( completionHandler: @escaping (BugModel) -> Void, bugID: Int){
        let url = URL(string: "https://acnhapi.com/v1/bugs/" + String(bugID))!
        var task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                let BugData = try JSONDecoder().decode(BugModel.self, from: data)
                completionHandler(BugData)
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}
