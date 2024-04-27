//
//  CurrentDate.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import Foundation

struct CustomDateFormatter {
    static func getCurrentDate() -> String {
        let timestamp = Date().timeIntervalSince1970
        let date = Date(timeIntervalSince1970: timestamp)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        let formattedDateString = dateFormatter.string(from: date)
        return formattedDateString
    }
    
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        let formattedDateString = dateFormatter.string(from: date)
        return formattedDateString
    }
    
    static func formatToDateForView(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        
        guard let date = dateFormatter.date(from: dateString) else {
            return nil 
        }
        
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let formattedDateString = dateFormatter.string(from: date)
        
        return formattedDateString
    }
}
