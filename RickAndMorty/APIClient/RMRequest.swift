//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import Foundation

final class RMRequest{
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint:RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    
    /// Create a URL for API Rick and Morty
    /// Check PathComponents from API and QueryComponents and create a string format from them
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "/\($0.name)=\(value)"
            }).joined(separator: "&")
            
           string += argumentString
        }
        
        return string
    }
    
    public let httpMethod = "GET"
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public init(endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}


extension RMRequest {
    static let listCharactersRequest = RMRequest( endpoint: .character)
}
