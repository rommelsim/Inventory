
import SwiftUI

struct tabView: View {
    @State var selectedTab = 0
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                
                HomeView().tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
                
                SearchView().tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
                
                FavouriteView().tabItem{
                    Image(systemName: "star.fill")
                    Text("Favourite")
                }.tag(2)
            }
            .animation(.linear)
            .transition(.slide)
        }
    }
}


