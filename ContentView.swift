//
//  ContentView.swift
//  AnimalCrossingAPI
//
//  Created by Matthew Weigand on 10/12/22.
//

import SwiftUI
import Kingfisher
import Subsonic

struct ContentView: View {
    @ObservedObject var apiV: FetchVillagerAPIData = FetchVillagerAPIData()
    @State var idV = -1
    @State var species = ""
    @State var personality = ""
    @State var birthday_string = ""
    @State var villager_icon = ""
    //@State var v_name = ""
    
    @State var villagerID = -1
    @State var villagerID_string = ""
    
    @ObservedObject var apiB: FetchBugAPIData = FetchBugAPIData()
    @State var idB = -1
    
    @State var bugID = -1
    @State var bugID_string = ""
    @State var bug_icon = ""
    @State var bug_price = -1
    @State var price_flick = -1
    
    @ObservedObject var apiF: FetchFishAPIData = FetchFishAPIData()
    @State var idF = -1
    
    @State var fishID = -1
    @State var fishID_string = ""
    @State var fish_icon = ""
    @State var name = ""
    @State var fish_price = -1
    @State var price_cj = -1
    
    @StateObject private var sound = SubsonicPlayer(sound: "acnhmusic.mp3")
    
    let bgImg: some View = Image("ACBackground")
        .resizable()
        .aspectRatio(contentMode: .fit)
    
    var body: some View {
        //Title for app
        ZStack {
            Color(UIColor.white).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button("Sound on") {
                        sound.play()
                    }
                    .mintButtonStyle()
                    
                    Button("Sound off") {
                        sound.stop()
                    }
                    .mintButtonStyle()
                }
                
                Spacer()
                
                Image("appiconacnh")
                    .resizable()
                    .frame(width: 300.0, height: 300.0, alignment: .center)
                
                Spacer()
                
                Text("ACNH Finder").font(.title)

                //Villager View
                DisclosureGroup("Villager Finder") {
                    Spacer()
                    KFImage(URL(string: villager_icon))
                        .overlay(
                            Circle()
                                .stroke(.mint, lineWidth: 4)
                        )
                        .shadow(radius: 9)
                    Text("Villager ID: " + String(self.idV))
                    //Text("Villager Name: " + self.v_name)
                    Text("Species: " + self.species)
                    Text("Personality: " + self.personality)
                    Text("Birthday: " + self.birthday_string)
                    
                    TextField("Enter an integer between 1-391 (Villager ID): ", text: $villagerID_string)
                        .multilineTextAlignment(.center)
                    
                    Button("Search Villagers"){
                        self.villagerID = Int(villagerID_string) ?? 0
                        apiV.fetchNewVillager(villagerID: self.villagerID)
                        
                        sleep(1)
                        
                        self.idV = apiV.id
                        self.species = apiV.species
                        self.personality = apiV.personality
                        self.villager_icon = apiV.icon_uri
                        self.birthday_string = apiV.birthday_string
                        //self.v_name = apiV.name
                    }
                    .mintButtonStyle()
                }
                .dgStyle()
                
                
                //Bug View
                DisclosureGroup("Bug Finder") {
                    Spacer()
                    KFImage(URL(string: bug_icon))
                        .overlay(
                            Circle()
                                .stroke(.mint, lineWidth: 4)
                        )
                        .shadow(radius: 9)
                    Text("Bug ID: " + String(self.idB))
                    Text("Nook's Cranny price: " + String(self.bug_price))
                    Text("Flick's price: " + String(self.price_flick))
                    
                    TextField("Enter an integer between 1-80 (Bug ID): ", text: $bugID_string)
                        .multilineTextAlignment(.center)
                    
                    Button("Search Bugs"){
                        self.bugID = Int(bugID_string) ?? 0
                        apiB.fetchNewBug(bugID: self.bugID)
                        
                        sleep(1)
                        
                        self.idB = apiB.id
                        self.bug_icon = apiB.icon_uri
                        self.bug_price = apiB.price
                        self.price_flick = apiB.price_flick
                    }
                    .mintButtonStyle()
                }
                .dgStyle()
                
                //Fish View
                DisclosureGroup("Fish Finder") {
                    Spacer()
                    KFImage(URL(string: fish_icon))
                        .overlay(
                            Circle()
                                .stroke(.mint, lineWidth: 4)
                        )
                        .shadow(radius: 9)
                    Text("Fish ID: " + String(self.idF))
                    Text("Fish name: " + self.name)
                    Text("Nook's Cranny price: " + String(self.fish_price))
                    Text("CJ's price: " + String(self.price_cj))
                    
                    TextField("Enter an integer between 1-80 (Fish ID): ", text: $fishID_string)
                        .multilineTextAlignment(.center)
                    
                    Button("Search Fish"){
                        self.fishID = Int(fishID_string) ?? 0
                        apiF.fetchNewFish(fishID: self.fishID)
                        
                        sleep(1)
                        
                        self.idF = apiF.id
                        self.fish_icon = apiF.icon_uri
                        self.name = apiF.name
                        self.fish_price = apiF.price
                        self.price_cj = apiF.price_cj
                    }
                    .mintButtonStyle()
                    
                }
                .dgStyle()
            }
            .foregroundColor(.mint)
            .padding() //VStack
        }
    } //body
} //ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Button {
    func mintButtonStyle() -> some View {
        self.buttonStyle(.borderedProminent)
            .tint(.mint)
            .foregroundColor(.white)
    }
}

extension DisclosureGroup {
    func dgStyle() -> some View {
        self.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.mint, lineWidth: 4)
            )
            .accentColor(.mint)
    }
}
