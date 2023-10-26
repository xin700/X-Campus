//
//  SingleListView.swift
//  xin-CampusLife
//
//  Created by xin on 2023/10/22.
//

import SwiftUI

struct SingleListView: View {
    
    @Binding var item:ToDoListItem
    
    @State var selectedColor: Color = .gray
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    var body: some View {
        
        

        HStack(spacing: 12.0){
            ZStack {
                Circle()
                    .fill(selectedColor)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 5) // 调整颜色选择器的位置
//                ColorPicker("", selection: $selectedColor)
            }
                            
            Image(systemName: IconList[item.img])
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 70, height: 70)
               .background(Color("IconBackgroundColor"))
               .cornerRadius(20)
            VStack(alignment: .leading) {
                

                
               Text(item.name)
                  .font(.headline)

               Text(item.details)
                  .lineLimit(2)
                  .lineSpacing(4)
                  .font(.subheadline)
                  .frame(height: 50.0)

                Text("\(item.deadline, formatter: dateFormatter)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }

        }
    }
    
    var IconList: [String] = ["figure.walk",
                            "figure.walk.arrival",
                            "figure.walk.departure",
                            "figure.walk.motion",
                            "figure.wave",
                            "figure.fall",
                            "figure.run",
                            "figure.american.football",
                            "figure.archery",
                            "figure.australian.football",
                            "figure.badminton",
                            "figure.barre",
                            "figure.baseball",
                            "figure.basketball",
                            "figure.bowling",
                            "figure.boxing",
                            "figure.climbing",
                            "figure.cooldown",
                            "figure.core.training",
                            "figure.cricket",
                            "figure.skiing.crosscountry",
                            "figure.cross.training",
                            "figure.curling",
                            "figure.dance",
                            "figure.disc.sports",
                            "figure.skiing.downhill",
                            "figure.elliptical",
                            "figure.equestrian.sports",
                            "figure.fencing",
                            "figure.fishing",
                            "figure.flexibility",
                            "figure.strengthtraining.functional",
                            "figure.golf",
                            "figure.gymnastics",
                            "figure.hand.cycling",
                            "figure.handball",
                            "figure.highintensity.intervaltraining",
                            "figure.hiking",
                            "figure.hockey",
                            "figure.hunting",
                            "figure.indoor.cycle",
                            "figure.jumprope",
                            "figure.kickboxing",
                            "figure.lacrosse",
                            "figure.martial.arts",
                            "figure.mind.and.body",
                            "figure.mixed.cardio",
                            "figure.open.water.swim",
                            "figure.outdoor.cycle",
                            "figure.pickleball",
                            "figure.pilates",
                            "figure.play",
                            "figure.pool.swim",
                            "figure.racquetball",
                            "figure.rolling",
                            "figure.rower",
                            "figure.rugby",
                            "figure.sailing",
                            "figure.skating",
                            "figure.snowboarding",
                            "figure.soccer",
                            "figure.socialdance",
                            "figure.softball",
                            "figure.squash",
                            "figure.stair.stepper",
                            "figure.stairs",
                            "figure.step.training",
                            "figure.surfing",
                            "figure.table.tennis",
                            "figure.taichi",
                            "figure.tennis",
                            "figure.track.and.field",
                            "figure.strengthtraining.traditional",
                            "figure.volleyball",
                            "figure.water.fitness",
                            "figure.waterpolo",
                            "figure.wrestling",
                            "figure.yoga"]
}
struct SingleList_Preview: PreviewProvider {

    

    static var previews: some View {
        @State var listContent = ToDoListItem(deadline: Date(),
                                        name: "Sample Item",
                                        details: "Sample details",
                                        priority: 1,
                                        status: false,
                                        Notification: false,
                                        tag: 0,
                                        subtasks: [],
                                        attachments: [],
                                        img: 10,
                                        repeatFrequency: .once)
        SingleListView(item: $listContent)
    }
}
