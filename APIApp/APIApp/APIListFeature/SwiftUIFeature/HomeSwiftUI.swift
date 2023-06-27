//
//  HomeSwiftUI.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 15/06/23.
//

import SwiftUI

struct HomeSwiftUI: View {
    @State var searchText = ""
    //var apiList: [String] = ["one", "two", "three", "thirty"]
    var apiList: [test] = [test(name: "one"), test(name: "two"), test(name: "three"), test(name: "thirty"), ]
    @StateObject var apiViewModel = APIListViewModel()

    //section, searchable, attribute text with bold style
    /*
     ?? searchResults is not @sate property then how does changing its values reload the views
     point 1: search text is @state -
     point 2: if search text is changed, then navigationStack updates its entire view - as we searchable is attached to navigation stack so its entire view gets reloaded
     */
    /*
     property wrpper cannot be applied to computed property, then how do you update ur search resutls and how do you reload the view when searchResults is changed
     */
    struct test: Identifiable {
        var id = UUID()
        var name: String
    }
    
    var searchResults: [APIModel] {
        print("setting search resutls --")

        //---working
//                if searchText.isEmpty {
//                    return apiList
//                }
//
//                else {
//                    return apiList.filter
//                    {
//                        ($0.name.lowercased()).contains(searchText.lowercased())
//                    }
//                }
        
//        return apiViewModel.apiList.filter
//        {
//            $0.Description.contains(searchText) || $0.API.contains(searchText)
//        }
        
        if searchText.isEmpty {
            return apiViewModel.apiList
        }

        else {
            return apiViewModel.apiList.filter
            {
                $0.Description.contains(searchText) || $0.API.contains(searchText)
            }
        }
    }

    @State private var multiSelection = Set<UUID>()
    @State private var selection = UUID()
    
    var body: some View {
        NavigationStack {
//            List(apiViewModel.apiList, selection: $multiSelection)  {
//
//                Text($0.API)
//                    .font(.system(size: 20))
//            }
            
            List {
                ForEach(searchResults) { apiItem in
                    VStack(alignment: .leading) {
                        Text(apiItem.API)
                            .font(.system(size: 20))
                        Text(apiItem.Description)
                            .font(.system(size: 20))
                        Text(apiItem.Link)
                            .font(.system(size: 20))
                    }
                }
            }
            .navigationTitle("API List")
            .navigationBarTitleDisplayMode(.inline)
        }.searchable(text: $searchText)
            .border(.blue)
        
        Spacer()
    }
    
}

struct HomeSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeSwiftUI()
    }
}

/*
 
 NavigationStack {
 List {
 ForEach(filteredMessages) { message in
 VStack(alignment: .leading) {
 Text(message.user)
 .font(.headline)
 
 Text(message.text)
 }
 }
 }
 .navigationTitle("Messages")
 }.searchable(text: $searchText) .onAppear(perform: runSearch)
 
 @State private var searchScope = SearchScope.inbox
 @State private var messages = [Message]()
 
 enum SearchScope: String, CaseIterable {
 case inbox, favorites
 }
 
 struct Message: Identifiable, Codable {
 let id: Int
 var user: String
 var text: String
 }
 
 
 var filteredMessages: [Message] {
 if searchText.isEmpty {
 return messages
 } else {
 return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
 }
 }
 
 
 func runSearch() {
 Task {
 guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }
 
 let (data, _) = try await URLSession.shared.data(from: url)
 messages = try JSONDecoder().decode([Message].self, from: data)
 }
 }
 */
