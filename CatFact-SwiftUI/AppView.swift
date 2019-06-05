//
//  AppView.swift
//  CatFact-SwiftUI
//
//  Created by joe cherry on 6/4/19.
//  Copyright © 2019 joe cherry. All rights reserved.
//

import SwiftUI

struct AppView : View {
    @EnvironmentObject private var presenter: AppPresenter
    
    var body: some View {
        VStack(spacing: 15) {
            Text(self.presenter.viewModel.fact.text)
                .color(Color.black)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding(.horizontal, 15)
            Button(action: {
                self.presenter.getFact()
            }) {
                Text("Get Fact!")
                }.frame(width: 100, alignment: .center)
        }
    }
}

#if DEBUG
struct AppView_Previews : PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(AppPresenter())
    }
}
#endif
