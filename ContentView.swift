import SwiftUI

struct TableExample: View {
    struct Schedule: Identifiable {
        let id = UUID()
        let name: String
        let period: String
        let color: Color
    }
    
    @State private var schedules: [Schedule] = [
        Schedule(name: "AP Stats", period: "1", color: .blue),
        Schedule(name: "AP Comp Science", period: "2", color: .yellow),
        Schedule(name: "Study Hall", period: "3", color: .gray),
        Schedule(name: "PE Waiver", period: "4", color: .black),
        Schedule(name: "Phil Lit", period: "5", color: .red),
        Schedule(name: "Ap Psych", period: "6", color: .green),
        Schedule(name: "College Cyber", period: "7", color: .purple),
        Schedule(name: "Art Portfolio", period: "8", color: .orange)
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
