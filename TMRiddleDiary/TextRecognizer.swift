//
//  TextRecognizer.swift
//  TMRiddleDiary
//
//  Created by NakaokaRei on 2023/07/16.
//

import Foundation
import Vision
import PencilKit

class TextRecognizer {
    var text: String = ""

    func recognizeText(canvasView: PKCanvasView) {
        guard let cgImage = canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 1.0).cgImage else { return }

        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest(completionHandler: self.recognizeTextHandler)
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ja-JP"]
        request.usesLanguageCorrection = true
        do {
            try requestHandler.perform([request])
        } catch {
            print(error)
        }
    }
    
    func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNRecognizedTextObservation] else {
            return
        }
        var recognizedText = ""
        for observation in observations {
            guard let topCandidate = observation.topCandidates(1).first else { return }
            recognizedText += topCandidate.string
        }
        text = recognizedText
        print(text)
    }
}

