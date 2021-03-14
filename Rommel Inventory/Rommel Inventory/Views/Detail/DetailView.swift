

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var FetchedItems:FetchedResults<Item>
    var items:Item
    
    var body: some View {
        NavigationView{
//            VStack(alignment: .leading){
//
//                /// Product Picture
//                HStack{
//                    if items.image.count != 0{
//                        /// Got picture to show
//                        Image(uiImage: UIImage(data: items.image)!)
//                            .resizable()
//                            .frame(maxWidth:300, maxHeight: 600)
//                            .aspectRatio(contentMode: .fit)
//                    }else{
//                        Image(systemName: "questionmark.circle.fill")
//
//                    }
//                }.padding()
//
//
//                Spacer()
//
//                /// Product Details
//                Section(header: Text("Product Details")){
//                    Text(items.name)
//                    Text("$\(items.price)")
//                    Text(String(items.quantity))
//                }
//                .padding()
//
//                Spacer()
//
//                /// Seller Contact Details
//                Section(header: Text("Seller Contact Details")){
//                    Text("Name: \(items.sellerData.name)")
//                    Text("Phone Numbe: \(items.sellerData.phone)")
//                    Text("Company: \(items.sellerData.company)")
//                    Text(items.sellerData.address)
//                }
//                .padding()
//            }
            ScrollView{
                VStack(alignment: .leading){
                    
                    VStack{
                        if items.image.count != 0 {
                            
                            Image(uiImage: UIImage(data: items.image)!)
                                .resizable()
                                .frame(maxWidth: 450, maxHeight: 390)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                        }
                        else { Image(systemName: "questionmark.circle.fill") }
                    }.padding()
                    
                    Divider()
                    
                    Section(header: Text("Product Details")
                                .bold()
                                .font(.title2)){
                        Divider()
                        Text(items.name)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                        Text("Quantity: \(items.quantity)")
                            .font(.headline)
                        Text("$\(String(items.price)) each")
                            .font(.headline)
                        Text(items.type)
                            .font(.headline)
                        Text("Length: \(String(items.length))")
                            .font(.headline)
                    }
                    
                    Divider()
                    
                    Text(items.sellerData.name)
                    Text(items.sellerData.phone)
                    Text(items.sellerData.company)
                    Text(items.sellerData.address)
                    
                }
                .padding()
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitle(Text("\(items.name)"), displayMode: .inline)
                .navigationBarItems(leading: Button("Delete"){
                    print("del btn press")
                }, trailing: Button("Edit"){
                    print("edit btn press")
                })
            }
        }
    }
}
