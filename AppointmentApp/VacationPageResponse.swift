//
//  VacationPageResponse.swift
//  AppointmentApp
//
//  Created by Attapon Peungsook on 1/8/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct VacationPageResponse: Codable {
    let status: StatusVacation
    let data: [Vacation]
}

// MARK: - Datum
struct Vacation: Codable {
    let datumDescription: String
    let typeID, vacationID: Int
    let subject: String
    let startDate, endDate: Int
    
    enum CodingKeys: String, CodingKey {
        case datumDescription = "description"
        case typeID = "typeId"
        case vacationID = "vacationId"
        case subject, startDate, endDate
    }
}

// MARK: - Status
struct StatusVacation: Codable {
    let code, message: String
}
