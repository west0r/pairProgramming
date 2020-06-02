//
//  PeopleService.swift
//  pairProgramming
//
//  Created by Марина Звягина on 02.06.2020.
//  Copyright © 2020 jonfir. All rights reserved.
//

import UIKit
import Combine

protocol PersonServiceInput {
    
    func obtainPeople() -> AnyPublisher<PersonResponse, Error>
    
}

final class PeopleService: PersonServiceInput {

    func obtainPeople() -> AnyPublisher<PersonResponse, Error> {
        let url = URL(string: "https://swapi.dev/api/people")!
        
        let urlSession = URLSession.shared
            
        let decoder = JSONDecoder()
        
        return urlSession.dataTaskPublisher(for: url).map { $0.data }
        .decode(type: PersonResponse.self, decoder: decoder)
        .eraseToAnyPublisher()
        
    }
    
}
