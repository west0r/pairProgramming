//
//  Person.swift
//  pairProgramming
//
//  Created by Евгений Елчев on 02.06.2020.
//  Copyright © 2020 jonfir. All rights reserved.
//

import Foundation

struct PersonResponse: Codable {
    let results: [Person]
}

struct Person: Codable {
    let name: String
    let height: String
    let mass: String
}
