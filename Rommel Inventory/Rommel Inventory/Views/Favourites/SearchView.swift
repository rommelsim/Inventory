//
//  FavouriteView.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 15/3/21.
//

import SwiftUI

struct SearchView: View {
    
    /// maybe no need to use fetchrequest
    @FetchRequest(entity: Item.entity(), sortDescriptors: [])
    var fetchedFavourites:FetchedResults<Item>
    
    @State var searchText:String = ""
    @State var isSearching:Bool = false
    
    
    var body: some View {
        VStack{
            HStack{
                TextField("Search", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8, antialiased: true)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isSearching = true
                    }
                    .overlay(
                        HStack{
                            Image(systemName: "manifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                        })
                if isSearching{
                    Button("Cancel"){
                        self.searchText = ""
                        self.isSearching = false
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            List{
                ForEach(self.fetchedFavourites.filter({
                    self.searchText.isEmpty ? true :
                        $0.description.contains(self.searchText)
                }), id:\.self){ item in
                    Text(item.name)
                }
            }
            // still deciding whether to put this in
        }.onTapGesture {
            self.isSearching = false
        }
    }
}


