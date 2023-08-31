//
//  AddView.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import UIKit

class AddView: BaseView {

    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let searchProtocolButton = {
        let button = UIButton()
        button.backgroundColor = .systemBrown
        return button
    }()

    let searchButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        return button
    }()

    let dateButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle(DateFormatter.today(), for: .normal)
        return button
    }()

    let titleButton = {
        let button = UIButton()
        button.setTitle("첫번째", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()

    let secondTitleButton = {
        let button = UIButton()
        button.setTitle("두번째", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()

    override func configureView() {
        addSubview(photoImageView)
        addSubview(searchProtocolButton)
        addSubview(searchButton)
        addSubview(dateButton)
        addSubview(titleButton)
        addSubview(secondTitleButton)
    }

    override func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.topMargin.leadingMargin.trailingMargin.equalTo(self).inset(10)
            make.height.equalTo(self).multipliedBy(0.3)
        }

        searchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.leading.bottom.equalTo(photoImageView)
        }

        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }

        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }

        titleButton.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }

        secondTitleButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
    }

}
