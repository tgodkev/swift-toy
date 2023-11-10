//
//  ContentView.swift
//  swift-toy
//
//  Created by Kevin Knight on 11/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        Text("Your name is \(item.name)")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                   
                }
            }
        } detail: {
            Text("Select an item")
            Text("and make it a good one.")
        }
    }
    
   private func generateRandomName() -> String {
        let names = ["Alice", "Bob", "Charlie", "Diana", "Ethan", "Fiona", "George", "Hannah", "Ian", "Julia", "Kevin", "Luna", "Michael", "Nora", "Oscar", "Paula", "Quinn", "Rachel", "Steve", "Tina", "Ulysses", "Vera", "William", "Xena", "Yvonne", "Zach"]
        return names.randomElement() ?? "Name" // Fallback in case randomElement returns nil
    }

   private func generateRandomAge(min: Int, max: Int) -> Int {
        return Int.random(in: min...max)
    }


    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), name: generateRandomName(), age: generateRandomAge(min: 0, max: 90))
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
