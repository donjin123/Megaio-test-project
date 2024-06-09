//
//  ContentView.swift
//  testProject
//
//  Created by Krunal Chaudhari on 08/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var observable = ListDataViewModel()
    
    var body: some View {
        NavigationStack {
            if observable.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(observable.listData, id: \.date) { index in
                        NavigationLink {
                            ListDetailView(title: index.title, description: index.explanation, imageUrl: index.hdurl ?? "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
                        } label: {
                            ListRowView(listData: index)
                        }
                    }
                }
                .listRowBackground(Color.clear)
                .listStyle(.plain)
                .navigationTitle("Nasa - Data")
            }
        }
        .onAppear {
            observable.getElementsData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
