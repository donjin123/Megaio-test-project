//
//  ListDetailView.swift
//  testProject
//
//  Created by Krunal Chaudhari on 08/06/24.
//

import SwiftUI

struct ListDetailView: View {
    var title: String
    var description: String
    var imageUrl: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                HStack {
                    if let imageUrl = URL(string: imageUrl) {
                        imageData(url: imageUrl)
                            .frame(height: 100)
                    }
                }
                .frame(width: 350, height: 450)
                .cornerRadius(8)
                .padding([.leading, .top , .bottom], 5)
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.caption)
            }
            .navigationTitle(title)
            .padding(.horizontal, 16)
        }
    }
    
    func imageData(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .padding([.top, .bottom], 10)
        .frame(width: 100, height: 80)
    }
}

#Preview {
    ListDetailView(title: "testgin tesfin testing", description: "New landers are on the Moon. Nearly two weeks ago, Japan's Smart Lander for Investigating Moon (SLIM) released two rovers as it descended, before its main lander touched down itself. The larger of the two rovers can hop like a frog, while the smaller rover is about the size of a baseball and can move after pulling itself apart like a transformer. The main lander, nicknamed Moon Sniper, is seen in the featured image taken by the smaller rover. Inspection of the image shows that Moon Sniper's thrusters are facing up, meaning that the lander is upside down from its descent configuration and on its side from its intended landing configuration.  One result is that Moon Sniper's solar panels are not in the expected orientation, so that powering the lander had to be curtailed and adapted.  SLIM's lander has already succeeded as a technology demonstration, its main mission, but was not designed to withstand the lunar night -- which starts tomorrow.", imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
}
