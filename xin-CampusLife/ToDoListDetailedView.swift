//
//  ToDoListDetailedView.swift
//  xin-CampusLife
//
//  Created by xin on 2023/10/18.
//

import SwiftUI

struct ToDoListDetailedView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var ToDoListItem: ToDoListItem
    
    func Date2Str(DateString: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        let dateString = dateFormatter.string(from: DateString)

        return dateString
//        print("格式化后的日期字符串：\(dateString)")

    }
    var body: some View {
        

        VStack(alignment: .leading, spacing: 10) {
            
            
            DetailRow(title: "Name",
                      content: ToDoListItem.name,
                      color: Color(.blue).opacity(0.2))
            
            DetailRow(title: "Deadline", 
                      content:
                        "\(Date2Str(DateString: ToDoListItem.deadline))",
                      color: Color(.green).opacity(0.2))
            
            DetailRow(title: "Details", 
                      content: ToDoListItem.details,
                      color: Color(.purple).opacity(0.2))
            // 添加其他属性
            
            ZStack {
                Color.blue.opacity(0.7) // 设置背景颜色和透明度
                    .cornerRadius(40)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .foregroundColor(.white)
                })
                .padding()
            }
            .padding(.top, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }


            
        .frame(width: 300,height: 300)
        .padding(20)
        .background(Color(.systemBackground).opacity(0.6)) // 设置背景颜色和透明度
        .cornerRadius(10)
        .shadow(radius: 5)
        .navigationBarTitle(Text("To Do List Details"), displayMode: .inline)


        
        
        
        
    }
}

struct DetailRow: View {
    var title: String
    var content: String
    var color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
                .padding(.trailing, 5)
            Text(content)
                .padding(5)
                .background(color.opacity(0.5)) // 设置砖块颜色和透明度
                .cornerRadius(5)
        }
    }
}

struct ToDoListDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        let fakeToDoItem = ToDoListItem(deadline: Date(),
                                        name: "Sample Item",
                                        details: "Sample details",
                                        priority: 1,
                                        status: false,
                                        Notification: false,
                                        tag: 0,
                                        subtasks: [],
                                        attachments: [],
                                        img: 1,
                                        repeatFrequency: .once)
        
        return NavigationView {
            ToDoListDetailedView(ToDoListItem: .constant(fakeToDoItem))
        }
    }
}
