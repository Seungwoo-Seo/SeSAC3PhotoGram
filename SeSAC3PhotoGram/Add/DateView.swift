//
//  DateView.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/29.
//

import UIKit

final class DateView: BaseView {
    let picker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()

    override func configureView() {
        addSubview(picker)
    }

    override func setConstraints() {
        picker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}


