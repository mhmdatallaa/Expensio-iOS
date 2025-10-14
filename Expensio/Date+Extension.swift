//
//  Date+Extension.swift
//  Expensio
//
//  Created by Mohamed Atallah on 14/10/2025.
//

import Foundation

extension Date {
    func dayHourMinuteString(local: Locale = .current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, HH:mm"
        formatter.locale = local
        let formattedDate = formatter.string(from: self)
        return formattedDate
    }
}
