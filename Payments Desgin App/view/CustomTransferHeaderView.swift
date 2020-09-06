//
//  CustomTransferHeaderView.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomTransferHeaderView: UIView {

    var controller:TransferViewController?{
        didSet{
            backBtn.addTarget(controller, action: #selector(TransferViewController.backBtnPressed), for: .touchUpInside)
        }
    }
    
    let backView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0, alpha: 0.1)
        v.layer.cornerRadius = 12
        v.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return v
    }()
    
    let backBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = CustomColor.customBlack
        return btn
    }()
    
    let balanceLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = CustomColor.customBlack
        l.text = "Balance"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 21)
        return l
    }()
    
    let priceLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = CustomColor.customBlack
        l.text = "$ 7,658.00"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 38)
        return l
    }()
    
    let stackView:UIStackView = {
        let v = UIStackView()
        v.spacing = 10
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let selectedView1:CustomSelectedView = {
        let v = CustomSelectedView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let selectedView2:CustomSelectedView = {
        let v = CustomSelectedView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.defaultLabel.text = "All user"
        v.defaultLabel.textColor = .lightGray
        v.indicatorView.isHidden = true
        return v
    }()
    
    let selectedView3:CustomSelectedView = {
        let v = CustomSelectedView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.defaultLabel.text = "New user"
        v.defaultLabel.textColor = .lightGray
        v.indicatorView.isHidden = true
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.addArrangedSubview(selectedView1)
        stackView.addArrangedSubview(selectedView2)
        stackView.addArrangedSubview(selectedView3)
        addSubview(balanceLabel)
        addSubview(priceLabel)
        addSubview(backView)
        backView.addSubview(backBtn)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 46),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            balanceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            balanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            priceLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 3),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.widthAnchor.constraint(equalToConstant: 60),
            backView.heightAnchor.constraint(equalToConstant: 40),
            backView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor , constant: 15),
            
            backBtn.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            backBtn.heightAnchor.constraint(equalToConstant: 25),
            backBtn.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
