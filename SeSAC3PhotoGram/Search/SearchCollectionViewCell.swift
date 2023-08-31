//
//  SearchCollectionViewCell.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import Kingfisher
import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {

    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBlue
        view.contentMode = .scaleToFill
        return view
    }()

    override func configureView() {
        contentView.addSubview(imageView)
    }

    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

    func bind(to urlString: String) {
        let url = URL(string: urlString)
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "star")
        )
    }

}
