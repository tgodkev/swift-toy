// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var tasks = [Task]()  // Your tasks array
    @State private var newTaskTitle = "" // State variable to hold the current input

    var body: some View {
        VStack {
            // TextField to enter new task
            TextField("Enter new task", text: $newTaskTitle, onCommit: addTask)
                .textFieldStyle(.roundedBorder)
                .padding()

            // List of tasks
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                            .onTapGesture {
                                toggleTaskCompletion(task)
                            }
                        
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        .navigationTitle("ToDo List")
    }

    private func addTask() {
        let newTask = Task(title: newTaskTitle, isCompleted: false)
        tasks.append(newTask)
        
        newTaskTitle = "" // Clear the input field
    }
    
    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()  // Toggle the completion status
            tasks.remove(at: index)
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
 
