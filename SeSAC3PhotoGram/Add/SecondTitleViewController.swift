//
//  SecondTitleViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/29.
//

import UIKit

final class SecondTitleViewController: BaseViewController {

    let textField = {
        let textField = UITextField()
        textField.placeholder = "두번째 제목을 입력하세요"
        return textField
    }()

    let sampleView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    let greenView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()

    // Closure - 1
    var completionHandler: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    deinit {
        print("deinit", self)
    }

    func setAnimation() {
        // 시작
        sampleView.alpha = 0
        greenView.alpha = 0
        // 끝
//        UIView.animate(withDuration: 3) { [weak self] in
//            self?.sampleView.alpha = 1
//        }
        UIView.animate(
            withDuration: 1,
            delay: 2,
            options: []
        ) {
            self.sampleView.alpha = 1
            self.sampleView.backgroundColor = .blue
        } completion: { bool in
            self.greenView.alpha = 1
        }

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // Closure - 2
        completionHandler?(textField.text ?? "")
    }

    override func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(textField)
        view.addSubview(sampleView)
        view.addSubview(greenView)
        setAnimation()
    }

    override func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }

        sampleView.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.center.equalTo(view)
        }

        greenView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view).offset(80)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

//        DispatchQueue.main.async {
            self.greenView.alpha = 1.0
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 0.5
            }
//        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

//        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 1.0
            }
//        }
    }

}

