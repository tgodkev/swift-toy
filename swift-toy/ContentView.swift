// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var tasks = [Task]()
    @State private var newTaskTitle = ""

    var body: some View {
        VStack {
            TextField("Enter new task", text: $newTaskTitle, onCommit: addTask)
                .textFieldStyle(.roundedBorder)
                .padding()

            List {
                ForEach(tasks) { task in
                    Text(task.title)
                    Text(task.isCompleted)
                }
                .onDelete(perform: deleteTask)
            }
        }
        .navigationTitle("ToDo List")
    }

    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
