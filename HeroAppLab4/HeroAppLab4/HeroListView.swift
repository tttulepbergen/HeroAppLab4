//
//  HeroListView.swift
//  HeroAppLab4
//
//  Created by Тулепберген Анель  on 27.03.2025.
//

import SwiftUI

struct HeroListView: View {
    @StateObject private var viewModel: HeroListViewModel

    init(service: HeroService = HeroService(), router: HeroRouter = HeroRouter()) {
        _viewModel = StateObject(wrappedValue: HeroListViewModel(service: service, router: router))
    }

    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                NavigationLink(destination: viewModel.router.makeHeroDetailView(hero: hero)) {
                    HStack {
                        AsyncImage(url: URL(string: hero.image.url)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(hero.name)
                                .font(.headline)
                            Text(hero.biography.fullName)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("SuperHeroes")
            .onAppear {
                viewModel.fetchHeroes()
            }
        }
    }
}
