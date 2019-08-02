//
//  etAvailableLeaveDayResponse.swift
//  AppointmentApp
//
//  Created by Attapon Peungsook on 1/8/2562 BE.
//  Copyright © 2562 SCB. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct AvailableLeaveResponse: Codable {
    let status: StatusDetail
    let data: [DataClass]
}

// MARK: - Datum
struct DataClass: Codable {
    let typeId: Int
    let typeName: String
    let day: Int
}

// MARK: - Status
struct StatusDetail: Codable {
    let code, message: String
}
