//
//  ToDoItemView.swift
//  CoreDataToDoList
//
//  Created by Maijuriina Mustonen on 15/02/2021.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var timestamp:String = ""
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    Text(timestamp)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "Todo The Great", timestamp: "Today")
    }
}
