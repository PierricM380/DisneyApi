//
//  ContentView.swift
//  DisneyApi
//
//  Created by Pierric Marye on 05/01/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var disneyVM: DisneyModelView
    
    var body: some View {
        NavigationView {
            List {
                ForEach(disneyVM.characters) { character in
                    HStack {
                        AsyncImage(url: character.imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 75.0, height: 75.0)
                        } placeholder: {
                            ProgressView()
                        }

                        Text(character.name)
                            .font(.title3)
                            .padding(.leading)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Disney")
            .listStyle(PlainListStyle())
        }
        .task {
            await disneyVM.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DisneyModelView())
    }
}
