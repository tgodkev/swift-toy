// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var tasks = [Task]()  // Your tasks array
    @State private var newTaskTitle = "" // State variable to hold the current input
    @State private var newTaskContent = "" // State var for the content

    var body: some View {
        VStack {
            // TextField to enter new task
            TextField("Enter new task", text: $newTaskTitle)
                .textFieldStyle(.roundedBorder)
                .padding()
            if !newTaskTitle.isEmpty{
                TextField("Enter a description", text: $newTaskContent).textFieldStyle(.roundedBorder).padding()
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
            VStack {
                if !newTaskTitle.isEmpty{
                    Button("Add Task", action: addTask)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }

            // List of tasks
            List {
                ForEach(tasks) { task in
                    HStack {
                        VStack{
                            Text(task.title)
                            Text(task.copy)
                        }
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
        let newTask = Task(title: newTaskTitle, copy: newTaskContent, isCompleted: false )
        
        tasks.append(newTask)
        
        newTaskTitle = "" // Clear the input field
        newTaskContent = ""
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
 
#Preview {
    ContentView()
}
