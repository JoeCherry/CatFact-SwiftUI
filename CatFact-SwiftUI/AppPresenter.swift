//
//  AppPresenter.swift
//  CatFact-SwiftUI
//
//  Created by joe cherry on 6/4/19.
//  Copyright © 2019 joe cherry. All rights reserved.
//

import SwiftUI
import Combine

class ViewModel {
    let fact: CatFact
    
    init() {
        fact = CatFact(id: "", text: "Press the button for a cat fact!")
    }
    
    init(withFact fact: CatFact) {
        self.fact = fact
    }
}

final class AppPresenter: BindableObject {
    var didChange = PassthroughSubject<ViewModel, Never>()
    var api = ApiService()
    
    var viewModel: ViewModel {
        return _viewModel
    }
    
    private var _viewModel = ViewModel() {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self.viewModel)
            }
        }
    }
    
    func getFact() {
        api.getRandomFact { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let fact):
                self._viewModel = ViewModel(withFact: fact)
            }
        }
    }
}
