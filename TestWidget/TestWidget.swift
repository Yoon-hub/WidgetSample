//
//  TestWidget.swift
//  TestWidget
//
//  Created by 최윤제 on 2022/11/09.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct TestWidgetEntryView : View {
    var entry: Provider.Entry
    
    let izoneList = RealmManager.shared.getData()
    
    var body: some View {
        VStack {
            Text("\(izoneList[0].name) 나이: \(izoneList[0].age)")
                .bold()
            Text("\(izoneList[1].name) 나이: \(izoneList[1].age)")
                .bold()
            Text("\(izoneList[2].name) 나이: \(izoneList[2].age)")
                .bold()
            Text("\(izoneList[3].name) 나이: \(izoneList[3].age)")
                .bold()
        }
    }
}

struct TestWidget: Widget {
    let kind: String = "TestWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TestWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct TestWidget_Previews: PreviewProvider {  // 오른쪽의 프리뷰 설정
    static var previews: some View {
        TestWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
