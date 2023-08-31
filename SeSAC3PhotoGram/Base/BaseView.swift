//
//  BaseView.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        print("이거 실행되나?")
        configureView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {}
    func setConstraints() {}
}
