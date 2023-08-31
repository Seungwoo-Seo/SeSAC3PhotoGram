//
//  DateViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/29.
//

import UIKit

final class DateViewController: BaseViewController {

    let mainView = DateView()

    weak var delegate: PassDateDelegate?

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    deinit {
        print("deinit", self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        delegate?.receiveDate(date: mainView.picker.date)
    }

}
