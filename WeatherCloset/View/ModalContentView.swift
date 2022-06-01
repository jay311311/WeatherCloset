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
    @Binding var isPresented: Bool
    
    let webview = WKWebView()
    
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        print("실행:\(isPresented)")
        if  isPresented {
        
            
            self.webview.load(URLRequest(url: url))
            
        
        }else {
            print("끝남")
            DispatchQueue.main.async {
                self.webview.stopLoading()
            }
        }
        
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<ModalView>) {
        
    }
    
    
    
}

struct ModalContentView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(urlToLoad: "https://ko.codibook.net/search/?q=%EB%B0%98%ED%8C%94%EC%85%94%EC%B8%A0&filter=codi",isPresented: .constant(true))
    }
}
