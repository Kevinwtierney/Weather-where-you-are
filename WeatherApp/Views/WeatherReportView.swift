//
//  WeatherReportView.swift
//  WeatherApp
//
//  Created by Kevin Tierney on 11/22/21.
//

import SwiftUI
import WebKit

struct WeatherReportView: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context)-> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string:  "https://www.youtube.com/embed/\(videoID)") else{
            print("error")
            return
        }
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: youtubeURL))
        print(" loaded")
    }
}


