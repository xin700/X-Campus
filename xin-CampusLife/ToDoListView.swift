//
//  ToDoListView.swift
//  xin-CampusLife
//
//  Created by xin on 2023/10/18.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var ListContent: [ToDoListItem] = []
    @State var isSettingMenuShowing:Bool = false
    @State var isAddingMenuShowing:Bool = false
    

    var body: some View {
        NavigationView{
            
            List{
                ForEach($ListContent){ $item in
                    
                    NavigationLink(destination: ToDoListDetailedView(
                        ToDoListItem: $item
                    )){
                        SingleListView(item: $item)
                    }.padding(.horizontal,10)
                }.onDelete(perform: delete)
            }
            .navigationTitle("ToDoList")
            .navigationBarItems(
               trailing: EditButton()
            )
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button(action: {
                        isSettingMenuShowing.toggle()
                    }, label: {
                        Image(systemName: "gear")
                    })
                }
                
                
                ToolbarItem(placement: .bottomBar){
                    Button(action: {
                        isAddingMenuShowing.toggle()
                    }, label:{
                        Image(systemName: "plus")
                    })
                }
            }

            .onAppear {
                loadListContent()
            }

            
            
            .sheet(isPresented: $isAddingMenuShowing, content: {
                ToDoListAddingMenu(ListContent: $ListContent,
                                   isAddingMenuShowing: $isAddingMenuShowing)
            })
            
            .sheet(isPresented: $isSettingMenuShowing, content: {
                ToDoListSettingView()
            })
            
            
            
            
        }
        
    }
    
    
    
    func delete(at offsets: IndexSet) {
        ListContent.remove(atOffsets: offsets)
        saveListContent()
    }

    
    func loadListContent() {
        if let data = UserDefaults.standard.data(forKey: "ListContent") {
            if let decodedData = try? JSONDecoder().decode([ToDoListItem].self, from: data) {
                ListContent = decodedData
            }
        }
    }
    
    func saveListContent() {
        if let encodedData = try? JSONEncoder().encode(ListContent) {
            UserDefaults.standard.set(encodedData, forKey: "ListContent")
        }
    }


    
}

#Preview {
    ToDoListView()
}
