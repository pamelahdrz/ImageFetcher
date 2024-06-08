//
//  ImageFetcherView.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import SwiftUI
import Kingfisher

struct ImageFetcherView: View {
    struct Constraints {
        static let widthImage = 150.0
        static let heightImage = 150.0
        static let placeholderWidth = 170.0
        static let placeholderHeight = 140.0
        static let placeholderOpacity = 0.3
        static let bottomInset = 50.0
        static let buttonCornerRadius = 20.0
        static let shadowRadius = 5.0
    }
    
    @ObservedObject var presenter: ImageFetcherPresenter = ImageFetcherPresenter()
    
    var body: some View {
        NavigationView(content: {
            VStack {
                KFImage(presenter.images.randomElement()?.imageURL)
                    .renderingMode(.original)
                    .placeholder {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .opacity(Constraints.placeholderOpacity)
                            .frame(width: Constraints.placeholderWidth, height: Constraints.placeholderHeight)
                            .padding(EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero))
                    }
                    .retry(maxCount: 3, interval: .seconds(5))
                    .onSuccess { r in
                        print("success: \(r)")
                    }
                    .onFailure { e in
                        print("failure: \(e)")
                    }
                    .padding(EdgeInsets(top: .zero, leading: .zero, bottom: Constraints.bottomInset, trailing: .zero))
                    .frame(width: Constraints.widthImage, height: Constraints.heightImage)
                Button(action: {
                    Task {
                        await presenter.getImages()
                    }
                }, label: {
                    Text("Refresh Image".uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(Constraints.buttonCornerRadius)
                        .shadow(radius: Constraints.buttonCornerRadius)
                })
            }
            .padding(EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero))
            .navigationTitle("Image Fetcher")
        })
    }
}

struct ImageFetcherViewPreview: PreviewProvider {
    static var previews: some View {
        let presenter: ImageFetcherPresenter = ImageFetcherPresenter()
        ImageFetcherView(presenter: presenter)
    }
}

