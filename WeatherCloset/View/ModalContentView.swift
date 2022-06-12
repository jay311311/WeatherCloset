import SwiftUI
import WebKit


struct ModalView: UIViewRepresentable {
    var urlToLoad: String
    @Binding var isPresented: Bool
    
    var webview = WKWebView()
 
    func makeUIView(context: Context) -> WKWebView {
       
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
      
        if  isPresented {
          webview.allowsBackForwardNavigationGestures = true
            webview.load(URLRequest(url: url))
            
                    }else{
            
        }
        
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<ModalView>) {
        
    }
    

    mutating func dismantleUIView(_ uiView: WKWebView, coordinator: ()) {
        webview.stopLoading()
        webview.removeFromSuperview()
        print("나가니?")
    }
    }



struct ModalContentView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(urlToLoad: "https://ko.codibook.net/search/?q=%EB%B0%98%ED%8C%94%EC%85%94%EC%B8%A0&filter=codi",isPresented: .constant(true))
    }
}
