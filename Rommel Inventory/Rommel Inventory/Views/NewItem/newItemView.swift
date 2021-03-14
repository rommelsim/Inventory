//
//  newItemView.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 13/3/21.
//

import SwiftUI
import UIKit

struct newItemView: View {
    @State var ItemName:String = ""
    @State var ItemPrice:String = ""
    @State var ItemQuantity:String = ""
    
    @State var selectedItemType:Int = 1
    @State var typeArray = ["Fabric", "Wool", "Others"]
    
    @State var ItemLength:String = ""
    @State var selectedLengthType:Int = 1
    @State var lengthTypes = ["CM", "M", "INCHES"]
    
    @State var sellerName:String = ""
    @State var sellerPhoneNum:String = ""
    @State var sellerAddress:String = ""
    @State var sellerCompany:String = ""
    
    @State var showImagePicker:Bool = false
//    @State var image:Image
    @State var images:Data = .init(count: 0)
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var pm
    
    var body: some View {
        NavigationView{
            Form{
                
                /// Item Details
                Section(header:Text("Item Details")){
                    TextField("Eg. Batman Blanket", text: $ItemName)
                    TextField("Eg. $6.75", text: $ItemPrice)
                    TextField("Eg. 10", text:$ItemQuantity)
                }
                
                /// Item Measurement and Quantity
                Section(header:Text("Specifics")){
                    Picker(selection: $selectedItemType, label: Text("Type"), content: {
                        ForEach(0..<typeArray.count){ i in
                            Text(typeArray[i]).tag(typeArray[i])
                        }
                    })
                    HStack{
                        TextField("9.15", text:$ItemLength)
                        Picker(selection: $selectedLengthType, label: Text("Measurement"), content: {
                            ForEach(0..<lengthTypes.count){ i in
                                Text(lengthTypes[i]).tag(lengthTypes[i])
                            }
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                /// Seller Information
                Section(header:Text("Seller Information")){
                    TextField("Bob Dylan", text:$sellerName)
                    TextField("91234567", text:$sellerPhoneNum)
                    TextField("WestView Blk 3333", text: $sellerAddress)
                        .padding(.vertical, 10)
                    TextField("Apple Inc.", text:$sellerCompany)
                }
                
                
                Button("Add Photo"){
                    self.showImagePicker = true
                }
                .sheet(isPresented: $showImagePicker){
                    ImagePickerView(sourceType: .photoLibrary){ image in
                        self.images = image.pngData()!
                        print("image here")
                    }
                }
            }
            .navigationBarItems(leading: Button("Cancel"){
                // Close view
                pm.wrappedValue.dismiss()
                print("close view")
            }, trailing: Button("Done"){
                // Save then close view
                
                let newSeller = Seller(context: moc)
                newSeller.name = self.sellerName
                newSeller.phone = self.sellerPhoneNum
                newSeller.address = self.sellerAddress
                newSeller.company = self.sellerCompany
                
                let newItem = Item(context: moc)
                newItem.id = UUID()
                newItem.name = self.ItemName
                newItem.price = Double(self.ItemPrice) ?? 0
                newItem.quantity = Int16(self.ItemQuantity) ?? 0
                newItem.type = self.typeArray[self.selectedItemType]
                newItem.length = Int16(self.ItemLength) ?? 0
                newItem.image = self.images
                newItem.sellerData = newSeller
                
                do{
                    try moc.save()
                    print("saved and view closed")
                    pm.wrappedValue.dismiss()
                }catch{
                    print(error.localizedDescription)
                }
                
            })
            .navigationBarTitle("New Item")
        }
        
    }
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
//    }
}
