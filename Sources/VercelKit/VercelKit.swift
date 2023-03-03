//
// File.swift
// 
//
// Created by LeoSM_07 on 3/2/23.
//

import Foundation

public protocol VercelData: Codable, Sendable { }

public struct VercelApi {
    public var token: String

    public init(token: String) {
        self.token = token
    }
}
