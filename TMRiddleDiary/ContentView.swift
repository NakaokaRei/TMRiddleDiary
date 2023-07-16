//
//  ContentView.swift
//  TMRiddleDiary
//
//  Created by NakaokaRei on 2023/07/15.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canvasView = PKCanvasView()
    let textRecognizer = TextRecognizer()

    var body: some View {
        VStack {
            DrawingView(canvasView: $canvasView)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(action: {
                textRecognizer.recognizeText(canvasView: canvasView)
                canvasView.drawing = PKDrawing()
            }) {
                Text("Recognize")
            }
        }
    }
}

#Preview {
    ContentView()
}
