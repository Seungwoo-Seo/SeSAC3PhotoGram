//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import UIKit

final class SearchViewController: BaseViewController {
    // MARK: - View
    let mainView = SearchView()

    // MARK: - Data
    var webImageList: [WebImage] = []
    var completion: ((String) -> Void)?

    // MARK: - Manager
    let networkManager = NetworkManager.shared

    // MARK: - delegate
    weak var delegate: PassImageDelegate?

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        // addObserver보다 post가 먼저 신호를 보내면
        // 당연히 받을 수 없지
        //
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(recommandKeywordNotificationObserver),
            name: NSNotification.Name("RecommandKeyword"),
            object: nil
        )
    }

    @objc
    func recommandKeywordNotificationObserver(
        _ notification: NSNotification
    ) {

    }

    override func configureView() {
        super.configureView()

        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }

}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(
        _ searchBar: UISearchBar
    ) {
        guard let query = searchBar.text,
              !(query.trimmingCharacters(
                in: .whitespaces
              ).isEmpty)
        else {return}

        networkManager.fetchWebImage(
            query: query
        ) { [weak self] webImageContainer in
            self?.webImageList = webImageContainer.results

            DispatchQueue.main.async {
                self?.mainView.collectionView.reloadData()
            }
        }
        mainView.searchBar.resignFirstResponder()
    }

}

extension SearchViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return webImageList.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SearchCollectionViewCell",
            for: indexPath
        ) as? SearchCollectionViewCell

        let webImage = webImageList[indexPath.item]
        cell?.bind(to: webImage.urls.full)

        return cell ?? UICollectionViewCell()
    }

}

extension SearchViewController: UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let webImage = webImageList[indexPath.item]
        completion?(webImage.urls.full)
        navigationController?.popViewController(animated: true)
    }

}
