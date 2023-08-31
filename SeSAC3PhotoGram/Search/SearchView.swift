//
//  SearchView.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import UIKit

class SearchView: BaseView {

    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()

    lazy var collectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout()
        )
        view.register(
            SearchCollectionViewCell.self,
            forCellWithReuseIdentifier: "SearchCollectionViewCell"
        )
        return view
    }()

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(
            width: size / 4,
            height: size / 4
        )
        return layout
    }

    override func configureView() {
        addSubview(searchBar)
        addSubview(collectionView)
    }

    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }

}
