//
//  BaseViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import SnapKit
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setConstraints()
    }

    func configureView() {
        view.backgroundColor = .white
        print("Base ConfigureView")
    }

    func setConstraints() {
        print("Base setConstraints")
    }

}
