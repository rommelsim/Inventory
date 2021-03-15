//
//  HomeView.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 13/3/21.
//

import SwiftUI

struct HomeView: View {
    @State var showNewItemView:Bool = false
    @State var showFavouritesOnly:Bool = false
    @State var selectedTab = 0
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var FetchedItems:FetchedResults<Item>
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(FetchedItems) { item in
                    NavigationLink(destination: DetailView(items: item)){
                        HomeRow(items:item)
                    }.contextMenu{
                        Button("Add to Favourites \(Image(systemName: "star.filled"))"){
                            moc.performAndWait {
                                item.favourite.toggle()
                                try? moc.save()
                                print("Favourites saved and added\n")
                            }
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        moc.delete(FetchedItems[index])
                    }
                    do{
                        try moc.save()
                    }catch{
                        print(error.localizedDescription)
                    }
                })
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Inventory")
            .navigationBarItems(leading: Button("Debug"){
                for data in FetchedItems{
                    print(data)
                }
            }, trailing: Button("\(Image(systemName: "plus"))"){
                self.showNewItemView.toggle()
            }.sheet(isPresented: $showNewItemView, content: {
                newItemView()
            }))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
