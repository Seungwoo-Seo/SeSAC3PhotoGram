//
//  HomeView.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/31.
//

import UIKit

final class HomeView: BaseView {

    weak var delegate: HomeViewProtocl?

    lazy var collectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout()
        )
        view.dataSource = self
        view.delegate = self
        view.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "UICollectionViewCell"
        )
        return view
    }()

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let size = UIScreen.main.bounds.width - 32
        layout.itemSize = CGSize(
            width: size / 3,
            height: size / 3
        )
        return layout
    }

    override func configureView() {
        addSubview(collectionView)
    }

    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension HomeView: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "UICollectionViewCell",
            for: indexPath
        )

        cell.backgroundColor = .brown

        return cell
    }

}

extension HomeView: UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        delegate?.didSelectItemAt(
            indexPath: indexPath
        )
    }

}
