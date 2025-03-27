//
//  HeroListViewModel.swift
//  HeroAppLab4
//
//  Created by Тулепберген Анель  on 27.03.2025.
//

import SwiftUI
import Combine

class HeroListViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let service: HeroService
    let router: HeroRouter

    init(service: HeroService = HeroService(), router: HeroRouter = HeroRouter()) {
        self.service = service
        self.router = router
    }

    func fetchHeroes() {
        isLoading = true
        service.fetchHeroes()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] heroes in
                self?.heroes = heroes
            })
            .store(in: &cancellables)
    }
}
