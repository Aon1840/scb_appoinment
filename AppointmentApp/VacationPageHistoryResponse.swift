//
//  VacationPageHistoryResponse.swift
//  AppointmentApp
//
//  Created by Attapon Peungsook on 1/8/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation


struct VacationPageHistoryResponse: Codable {
    let status: StatusVacationHistory
    let data: [VacationHistory]
}

struct VacationHistory: Codable {
    let endDate: Int
    let subject, description: String
    let typeID: Int
    let passed: Bool
    let vacationID, startDate: Int

    enum CodingKeys: String, CodingKey {
        case endDate, subject, description
        case typeID = "typeId"
        case passed
        case vacationID = "vacationId"
        case startDate
    }
}

struct StatusVacationHistory: Codable {
    let code, message: String
}


// MARK: - Welcome
//struct VacationPageHistoryResponse: Codable {
//    let status: StatusVacationHistory
//    let data: [VacationHistory]
//}
//
//
//// MARK: - Datum
//struct VacationHistory: Codable {
//    let endDate: Int
//    let subject, datumDescription: String
//    let typeID: Int
//    let passed: Bool
//    let vacationID, startDate: Int
//
//    enum CodingKeys: String, CodingKey {
//        case endDate, subject
//        case datumDescription = "description"
//        case typeID = "typeId"
//        case passed
//        case vacationID = "vacationId"
//        case startDate
//    }
//}
//
//// MARK: - Status
//struct StatusVacationHistory: Codable {
//    let code, message: String
//}
