//
//  ImageFetcherView.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import SwiftUI
import Kingfisher

struct ImageFetcherView: View {
    
    @ObservedObject var presenter: ImageFetcherPresenter = ImageFetcherPresenter()
    
    var body: some View {
        VStack {
            KFImage(presenter.images.randomElement()?.imageURL)
                .placeholder {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .font(.largeTitle)
                        .opacity(0.3)
                }
                .retry(maxCount: 3, interval: .seconds(5))
                .onSuccess { r in
                    print("success: \(r)")
                }
                .onFailure { e in
                    print("failure: \(e)")
                }.padding(EdgeInsets(top: .zero, leading: .zero, bottom: 50.0, trailing: .zero))
            
            Button(action: {
                Task {
                    await presenter.getImages()
                }
                        }, label: {
                            Text("Refresh Images".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        })
        }
        .padding()
    }
}

struct ImageFetcherViewPreview: PreviewProvider {
    static var previews: some View {
        let interactor: ImageFetcherInteractor = ImageFetcherInteractorImplementation()
        let presenter: ImageFetcherPresenter = ImageFetcherPresenter(interactor: interactor)
        
        ImageFetcherView(presenter: presenter)
    }
}

