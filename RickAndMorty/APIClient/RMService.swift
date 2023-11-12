//
//  RMService.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import Foundation

/// Primary API service object
final class RMService{
    
    /// Shared singelton instance
    static let shared = RMService()
    
    /// Constructor
    private init () {}
    
    
    /// execute
    /// - Parameters:
    ///   - request: get a recusest call from API
    ///   - completion: Add or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
}
