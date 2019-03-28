//
//  OverviewController.swift
//  App
//
//  Created by Bryan on 3/28/19.
//

import Foundation
import Vapor

final class OverviewController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> [Overview] {
        let notes = """
- New Service/integration view
- Create customers while submitting an integration, creating a note/appointment/status
- Move home services into the “. . .” More list of actions
"""
        let iOS = Overview(app: "Canvass iOS", version: "v.1.12.1", qualityScore: "97%", upcomingVersion: "v1.12.2", releaseNotes: notes)
        let android = Overview(app: "Canvass Android", version: "v.1.27", qualityScore: "78%", upcomingVersion: "v1.31", releaseNotes: notes)
        return [iOS, android]
    }
    
    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }
    
    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
            }.transform(to: .ok)
    }
}

