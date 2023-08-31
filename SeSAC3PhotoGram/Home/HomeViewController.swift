//
//  HomeViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/31.
//

import UIKit

// AnyObject: 클래스에서만 프로토콜을 정의할 수 있도록 제약
protocol HomeViewProtocl: AnyObject {
    func didSelectItemAt(indexPath: IndexPath)
}

final class HomeViewController: BaseViewController {

    override func loadView() {
        let view = HomeView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(self, #function)
    }

    deinit {
        print(self, #function)
    }

}

extension HomeViewController: HomeViewProtocl {

    func didSelectItemAt(indexPath: IndexPath) {
        print(#function)
    }

}
