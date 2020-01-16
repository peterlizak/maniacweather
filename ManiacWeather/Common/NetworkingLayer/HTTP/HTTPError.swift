//
//  HTTPError.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

// TODO: Rename this to HTTPResponseDescription
enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case unableToBuildRequest = "Unable to build the request."
    case unableToParseURLResponse = "Unable to convert URLResponse to HTTPURLResponse. URLResponse may be nil"
}
