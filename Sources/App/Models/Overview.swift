//
//  Overview.swift
//  App
//
//  Created by Bryan on 3/28/19.
//

import Foundation
import Vapor

struct Overview: Content {
    let app: String
    let version: String
    let qualityScore: String
    let upcomingVersion: String
    let releaseNotes: String
    
}
