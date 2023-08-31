//
//  WebViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/29.
//

import UIKit
import WebKit

final class WebViewController: UIViewController, WKUIDelegate {

    var webView = WKWebView()

//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(100)
        }

        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // 네비게이션 컨트롤러가 처음에 투명, 스크롤 하면 불투명
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = appearance
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        title = "이건 웹뷰입니다"
    }

    func didTapReloadButton() {
        // 웹 화면에서 새로고침 버튼 클릭한 것
        webView.reload()
    }

    func didTapGoBackButton() {
        // 뒤로가기 버튼이 활성화 되었다면
        if webView.canGoBack {
            // 뒤로가라
            webView.goBack()
        }
    }

    func didTapGoForwardButton() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
