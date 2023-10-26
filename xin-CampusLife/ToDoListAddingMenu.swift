//
//  ToDoListAddingMenu.swift
//  xin-CampusLife
//
//  Created by xin on 2023/10/18.
//
import SwiftUI

struct ToDoListAddingMenu: View {
    @Binding var ListContent: [ToDoListItem]
    @Binding var isAddingMenuShowing: Bool
    
    
    @State private var showAlert = false
    @State var NewContentName: String = ""
    @State var deadline = Date()
    @State var details = ""
    @State var priority = 1
    @State var status = false
    @State var notification = false
    @State var tag = 0
    
    var body: some View {
        VStack {
            TextField("Name", text: $NewContentName)
                .padding()


            
//            DatePicker("Deadline", selection: $deadline, displayedComponents: .date)
//                .padding()
            DatePicker("Deadline", selection: $deadline, displayedComponents: [.date, .hourAndMinute])
                .padding()

            
            TextField("Details", text: $details)
                .padding()
            
            Stepper("Priority: \(priority)", value: $priority, in: 1...10)
                .padding()
            
            Toggle("Status", isOn: $status)
                .padding()
            
            Toggle("Notification", isOn: $notification)
                .padding()
            
            Stepper("Tag: \(tag)", value: $tag, in: 0...5)
                .padding()
            
            Button(action: {
                if !NewContentName.isEmpty && !details.isEmpty {
                    addListContent()
                    saveListContent()
                    isAddingMenuShowing = false
                } else {
                    showAlert = true
                }
            }, label: {
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 150, height: 40)
                    .padding(.horizontal)
                    .overlay(Text("Save").foregroundColor(.white))
            })
            .padding(.top, 20)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("警告"),
                    message: Text("请输入必要信息"),
                    dismissButton: .default(Text("OK"))
                )
            }


            
            
        }
    }
    
    func addListContent() {
        
        
        let randomValue = Int.random(in: 1..<66)
        
        let newItem = ToDoListItem(deadline: deadline,
                                          name: NewContentName,
                                          details: details,
                                          priority: priority,
                                          status: status,
                                          Notification: notification,
                                          tag: tag,
                                          subtasks: [],
                                          attachments: [],
                                          img: randomValue,
                                          repeatFrequency: .once)
        ListContent.append(newItem)
    }
    func sortListByPriority() {
        ListContent.sort { $0.priority < $1.priority }
    }
    func saveListContent() {
        sortListByPriority()
        if let encodedData = try? JSONEncoder().encode(ListContent) {
            UserDefaults.standard.set(encodedData, forKey: "ListContent")
        }
    }

}
struct ToDoListAddingMenu_Previews: PreviewProvider {
    @State private static var listContent: [ToDoListItem] = []
    @State private static var isAddingMenuShowing: Bool = false

    static var previews: some View {
        ToDoListAddingMenu(ListContent: $listContent, isAddingMenuShowing: $isAddingMenuShowing)
    }
}
