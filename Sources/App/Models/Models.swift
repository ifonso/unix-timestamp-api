//
//  Models.swift
//  
//
//  Created by Afonso Lucas on 13/11/23.
//

import Foundation

struct DateRequest: Decodable {
    
    static let UTC_DATE_FORMATTER: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    let date: String
    
    public var getDate: Date? {
        Self.UTC_DATE_FORMATTER.date(from: self.date)
    }
}

struct DateResponse: Encodable {
    let unix: String
}

struct ErrorResponse: Encodable {
    let error: String
}
