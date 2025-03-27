//
//  Hero.swift
//  HeroAppLab4
//
//  Created by Тулепберген Анель  on 27.03.2025.
//

import Foundation

struct Hero: Identifiable, Codable {
    let id: Int
    let name: String
    let biography: Biography
    let powerstats: Powerstats
    let image: HeroImage
}

struct Biography: Codable {
    let fullName: String
}

struct Powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct HeroImage: Codable {
    let url: String
}
