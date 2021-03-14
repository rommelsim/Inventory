//
//  HomeRow.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 14/3/21.
//

import SwiftUI

struct HomeRow: View {
    @ObservedObject var items:Item
    
    
    var body: some View {
        HStack{
            /// Add small picture here
            if items.image.count != 0 {
                
                Image(uiImage: UIImage(data: items.image)!)
                    .resizable()
                    .frame(maxWidth: 65, maxHeight: 65)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
            }
            else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(maxWidth: 65, maxHeight: 65)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
            }

            VStack(alignment: .leading){
                Text(items.name)
                    .font(.title3)
                    .bold()
                Text("Price: $\(String(items.price))")
                Text("Quantity: \(items.quantity)")
            }
            
            Spacer()
            
            VStack{
                
                if items.favourite{
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                }else{
                    Image(systemName: "star")
                }
            }
            
        }.padding()
    }
}
