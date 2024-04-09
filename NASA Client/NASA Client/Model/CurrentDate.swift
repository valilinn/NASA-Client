//
//  CurrentDate.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

struct CurrentDate {
    var date: String = {
        let timestamp = Date().timeIntervalSince1970
        let date = Date(timeIntervalSince1970: timestamp)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        let formattedDateString = dateFormatter.string(from: date)
        return formattedDateString
    }()
}
