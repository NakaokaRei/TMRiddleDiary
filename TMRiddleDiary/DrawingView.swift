//
//  DrawingView.swift
//  TMRiddleDiary
//
//  Created by NakaokaRei on 2023/07/16.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        canvasView.drawingPolicy = .anyInput
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}

}
