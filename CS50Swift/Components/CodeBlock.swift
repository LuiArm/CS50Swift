//
//  CodeBlock.swift
//  CS50Swift
//
//  Created by luis armendariz on 09/21/26.
//


import UIKit
import SwiftUI

struct CodeBlock: View {
    let code: String
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            Text(code)
                .font(
                    .system(
                        size: 14,
                        design: .monospaced
                    )
                )
                .foregroundStyle(.white)
                .textSelection(.enabled)
                .padding()
        }
        .background(Color.black)
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
        .overlay(alignment: .topTrailing) {
            
            Button {
                UIPasteboard.general.string = code
            } label: {
                Image(systemName: "doc.on.doc")
                    .foregroundStyle(.white)
                    .padding(10)
            }
        }
    }
}


