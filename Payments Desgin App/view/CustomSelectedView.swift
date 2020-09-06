//
//  CustomSelectedView.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CustomSelectedView: UIView {

    let defaultLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 18)
        l.text = "Favorites"
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let indicatorView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.customBlack
        v.layer.cornerRadius = 3
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(defaultLabel)
        addSubview(indicatorView)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            defaultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            defaultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            indicatorView.topAnchor.constraint(equalTo: defaultLabel.bottomAnchor, constant: 5),
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 6),
            indicatorView.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
