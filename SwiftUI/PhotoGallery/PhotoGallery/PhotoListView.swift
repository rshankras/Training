//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Ravi Shankar on 03/10/24.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    let name: String
}

struct PhotoListView: View {
    
    // Sample data
    let photos = (1...20).map { Photo(name: "photo\($0)") }
    
    let columns = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(photos) { photo in
                            NavigationLink(destination: PhotoDetailView(photo: photo)) {
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                .navigationTitle("Photo Gallery")
            }
        }
    }
}

#Preview {
    PhotoListView()
}