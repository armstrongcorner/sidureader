//
//  BookListView.swift
//  sidureader
//
//  Created by Armstrong Liu on 20/07/2024.
//

import SwiftUI

struct BookListView: View {
    @Environment(BookTestData.self) var bookTestData
    
    var body: some View {
        let gridColumns = [
            GridItem(.fixed((UIScreen.screenWidth - 10*2 - 20*2) / 3), spacing: 20),
            GridItem(.fixed((UIScreen.screenWidth - 10*2 - 20*2) / 3), spacing: 20),
            GridItem(.fixed((UIScreen.screenWidth - 10*2 - 20*2) / 3), spacing: 20)
        ]
        
        NavigationSplitView {
            LazyVGrid(columns: gridColumns, spacing: 20) {
                ForEach(bookTestData.books) { book in
                    NavigationLink {
                        BookDetailView(book: book)
                    } label: {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.gray)
                            .frame(height: 100)
                            .overlay(
                                Text(book.title ?? "")
                                    .foregroundStyle(.white)
                            )
                    }
                }
            }
            .navigationTitle("书目")
            .padding(.horizontal, 20)
        } detail: {
            Text("请选择书目")
        }
    }
}

#Preview {
    BookListView().environment(BookTestData())
}
