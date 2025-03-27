//
//  HeroDetailView.swift
//  HeroAppLab4
//
//  Created by Тулепберген Анель  on 27.03.2025.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: hero.image.url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            
            Text(hero.name)
                .font(.largeTitle)
                .bold()
            
            Text("Full Name: \(hero.biography.fullName)")
                .font(.subheadline)
                .padding()
        }
        .navigationTitle(hero.name)
    }
}
