//
//  ModalView.swift
//  WeatherCloset
//
//  Created by Jooeun Kim on 2022/06/01.
//

import SwiftUI
import WebKit


struct ModalView: UIViewRepresentable  {
    var urlToLoad: String
    let webview = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        
        self.webview.load(URLRequest(url: url))
        
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<ModalView>) {
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(urlToLoad: "https://ko.codibook.net/search/?q=%EB%B0%98%ED%8C%94%EC%85%94%EC%B8%A0&filter=codi")
    }
}
