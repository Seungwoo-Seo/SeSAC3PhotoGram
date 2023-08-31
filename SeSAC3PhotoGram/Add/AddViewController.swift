//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/28.
//

import Kingfisher
import UIKit
import SeSACFramework

protocol PassDateDelegate: AnyObject {
    func receiveDate(date: Date)
}

protocol PassImageDelegate: AnyObject {
    func receiveImage(imageName: String)
}

// Main, Detail 같은 이름은 상징적이라서 나중에 Main, Detail View가 바뀔 수 있기 때문에 네이밍으로 비추천
final class AddViewController: BaseViewController {

    let mainView = AddView()

    // viewDidLoad보다 먼저 호출됨
    // 주의사항 -> super 메서드 호출하면 X
    // super를 호출하면 애플이 미리 만들어 놓은 것이 생성됨
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        APIService.shared.request()
    }

    deinit {
        print("deinit", self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(selectImageNotificationObserver),
            name: .selectImage,
            object: nil
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(
            self,
            name: .selectImage,
            object: nil
        )
    }

    override func configureView() {
        super.configureView()

        mainView.searchProtocolButton.addTarget(
            self,
            action: #selector(didTapSearchProtocolButton),
            for: .touchUpInside
        )
        mainView.searchButton.addTarget(
            self,
            action: #selector(didTapSearchButton),
            for: .touchUpInside
        )
        mainView.dateButton.addTarget(
            self,
            action: #selector(didTapDateButton),
            for: .touchUpInside
        )
        mainView.titleButton.addTarget(
            self,
            action: #selector(didTapTitleButton),
            for: .touchUpInside
        )
        mainView.secondTitleButton.addTarget(
            self,
            action: #selector(didTapSecondTitleButton),
            for: .touchUpInside
        )
    }

    override func setConstraints() {
        super.setConstraints()
    }

}

extension AddViewController: PassDateDelegate {

    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(
            DateFormatter.convertDate(date: date),
            for: .normal
        )
    }

}

extension AddViewController: PassImageDelegate {

    func receiveImage(imageName: String) {
        mainView.photoImageView.image = UIImage(
            systemName: imageName
        )
    }

}

extension AddViewController {

    @objc
    func didTapSecondTitleButton(_ sender: UIButton) {
        let vc = SecondTitleViewController()

        // Closure - 3
        vc.completionHandler = { text in
            self.mainView.secondTitleButton.setTitle(
                text,
                for: .normal
            )
            print("completion")
        }

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @objc
    func didTapTitleButton(_ sender: UIButton) {
        let vc = TitleViewController()

        // Closure - 3
        vc.completionHandler = { title, age, push in
            self.mainView.titleButton.setTitle(
                title,
                for: .normal
            )
            print("completion", age, push)
        }

        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

    @objc
    func didTapSearchProtocolButton(_ sender: UIButton) {
        let vc = SearchViewController()
        vc.delegate = self
        present(vc, animated: true)
    }

    @objc
    func selectImageNotificationObserver(
        _ notification: NSNotification
    ) {
        print(#function)

        guard let name = notification.userInfo?["name"] as? String,
              let _ = notification.userInfo?["sample"] as? String
        else {return}

        mainView.photoImageView.image = UIImage(systemName: name)
    }

    @objc
    func didTapSearchButton(_ sender: UIButton) {
        presentActionSheet()
    }

    @objc
    func didTapDateButton(_ sender: UIButton) {
        let vc = HomeViewController()
        navigationController?.pushViewController(
            vc,
            animated: true
        )
    }

}

private extension AddViewController {

    func presentActionSheet() {
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        let gallery = UIAlertAction(
            title: "갤러리에서 가져오기",
            style: .default
        )
        let web = UIAlertAction(
            title: "웹에서 검색하기",
            style: .default
        ) { [weak self] _ in
            let vc = SearchViewController()
            vc.completion = { urlString in
                let url = URL(string: urlString)
                self?.mainView.photoImageView.kf.setImage(with: url)
            }
            self?.navigationController?.pushViewController(
                vc,
                animated: true
            )
        }

        [cancel, gallery, web].forEach { alert.addAction($0) }

        present(alert, animated: true)
    }

}
