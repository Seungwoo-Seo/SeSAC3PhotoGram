//
//  TitleViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/29.
//

import UIKit

final class TitleViewController: BaseViewController {

    let textField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력하세요"
        return textField
    }()

    // Closure - 1
    var completionHandler: ((String, Int, Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // Closure - 2
        completionHandler?(
            textField.text ?? "",
            77,
            false
        )
    }

    deinit {
        print("deinit", self)
    }

    override func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(textField)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "완료",
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButtonItem)
        )
    }

    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }

}

private extension TitleViewController {

    @objc
    func didTapRightBarButtonItem(
        _ sender: UIBarButtonItem
    ) {
        completionHandler?(
            textField.text ?? "",
            100,
            true
        )
        navigationController?.popViewController(animated: true)
    }

}
