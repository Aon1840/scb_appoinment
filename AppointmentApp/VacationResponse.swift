//
//  VacationFutureResponse.swift
//  TestCardView
//
//  Created by Attapon Peungsook on 24/7/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct VacationResponse: Codable {
    let status: Status
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let idVacation, typeID, subject, datumDescription: String
    let startDate, endDate: String
    
    enum CodingKeys: String, CodingKey {
        case idVacation = "id_vacation"
        case typeID = "type_id"
        case subject
        case datumDescription = "description"
        case startDate = "start_date"
        case endDate = "end_date"
    }
}

// MARK: - Status
struct Status: Codable {
    let code, message: String
}
