//
//  RodrigosFile.swift
//  SwiftUITableView
//
//  Created by Luke J. Sivulka on 8/28/23.
//

import SwiftUI


    struct Schedule: Identifiable {
    let id = UUID()
    let name: String
    let period: String
    let color: Color
}

struct RodrigoFile: View {
    
    @State private var schedules: [Schedule] = [
        Schedule(name: "Adv strength & cond", period: "1", color: .red),
        Schedule(name: "Ap Comp SCI", period: "2", color: .black),
        Schedule(name: "Algebra 2", period: "3", color: .purple),
        Schedule(name: "Graphic Arts Design", period: "4", color: .yellow),
        Schedule(name: "Tutoring Practicum", period: "5", color: .blue),
        Schedule(name: "Introduction To Rhetoric", period: "6", color: .orange),
        Schedule(name: "Physics", period: "7", color: .green),
        Schedule(name: "Independent Learning Time", period: "8", color: .gray)
    ]
    
    @State private var sortOrder = [KeyPathComparator(\Schedule.name)]
    
    var body: some View {
        
        NavigationStack {
            Table(schedules, sortOrder: $sortOrder) {
                TableColumn("", value: \.period)
                    .width(32)
                TableColumn("Name", value: \.name)
                TableColumn("Color") { fruit in
                    Circle()
                        .frame(width: 16)
                        .foregroundColor(fruit.color)
                }
            }
            .onChange(of: sortOrder) {
                schedules.sort(using: $0)
            }
        }
    }
}



