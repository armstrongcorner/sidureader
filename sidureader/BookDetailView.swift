//
//  BookDetailView.swift
//  sidureader
//
//  Created by Armstrong Liu on 28/07/2024.
//

import SwiftUI

struct BookDetailView: View {
    var book: BookTest
    var body: some View {
        VStack {
            Text(book.content ?? "")
                .font(.system(size: 17))
                .lineSpacing(10.0)
                .padding()
            Spacer()
        }
        .navigationTitle(book.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let bookTestData = BookTestData()
    return BookDetailView(book: bookTestData.books[0])
}
