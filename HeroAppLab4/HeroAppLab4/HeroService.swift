//
//  HeroService.swift
//  HeroAppLab4
//
//  Created by Тулепберген Анель  on 27.03.2025.
//

import Foundation
import Combine

class HeroService {
    func fetchHeroes() -> AnyPublisher<[Hero], Error> {
        let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Hero].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
