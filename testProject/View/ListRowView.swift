//
//  ListRowView.swift
//  testProject
//
//  Created by Krunal Chaudhari on 08/06/24.
//

import SwiftUI

struct ListRowView: View {
    let listData: ElementData
    
    var body: some View {
        HStack {
            HStack {
                if let url = URL(string: listData.url) {
                    imageData(url: url)
                }
            }
            .frame(width: 150, height: 150)
            .cornerRadius(8)
            .padding([.leading, .top , .bottom], 5)
            VStack(alignment: .leading, spacing: 8) {
                // Title
                Text(listData.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(listData.date)
                    .font(.caption)
                    .lineLimit(1)
            }
            .padding(.leading, 10)
        }
        .frame(width: 300)
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
    ListRowView(listData: ElementData(date: "2023-01-02", explanation: "", hdurl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", mediaType: MediaType.image, serviceVersion: ServiceVersion.v1, title: "testing testing testing", url: "", copyright: ""))
}
