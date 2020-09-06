//
//  CustomBottomView.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomBottomView: UIView {

   
    
    lazy var stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.spacing = 20
        v.distribution = .fillEqually
        v.axis = .horizontal
        return v
    }()
    
    lazy var payButton:CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.btnLabel.text = "Pay"
        btn.btnImage.image = UIImage(named: "pay")
        btn.btnLabel.textColor = CustomColor.customBlack
        btn.layer.cornerRadius = 20
        btn.stackWidthAnchor?.constant = 60
        btn.setButtonShadow()
        return btn
    }()
    
    lazy var transferButton:CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.btnLabel.text = "Transfer"
        btn.btnImage.image = UIImage(named: "transfer")?.withRenderingMode(.alwaysTemplate)
        btn.btnImage.tintColor = .white
        btn.btnLabel.textColor = .white
        btn.layer.cornerRadius = 20
        btn.setButtonShadow()
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.addArrangedSubview(payButton)
        stackView.addArrangedSubview(transferButton)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UIButton {
    
    func setButtonShadow(){
        layer.shadowColor = UIColor(white: 0, alpha: 0.07).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 15
        layer.shadowOpacity = 1
    }
    
}
