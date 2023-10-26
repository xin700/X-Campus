//
//  ToDoListItem_Data.swift
//  xin-CampusLife
//
//  Created by xin on 2023/10/19.
//

import Foundation

struct ToDoListItem : Identifiable, Codable{
    var id = UUID()
    var deadline: Date //DDL
    var name: String   //name of the list
    var details: String  // details of the list
    var priority: Int  //priority if the list item
    var status: Bool  //completed or not
    var Notification: Bool //reminder
    var tag: Int //to categorize the list item
    var subtasks: [ToDoListItem] //subtask
    var attachments: [String] //files
    var img: Int // image
    enum RepeatFrequency: Codable{
        case once, daily, weekly, monthly, yearly
    }
    var repeatFrequency: RepeatFrequency
}

