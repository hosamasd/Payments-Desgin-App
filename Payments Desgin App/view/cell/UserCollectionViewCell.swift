//
//  UserCollectionViewCell.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    var data:UserData?{
        didSet {
            manageData()
        }
    }
    
    let cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 30
        return v
    }()
    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .lightGray
        img.layer.cornerRadius = 30
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    let cardName:UILabel = {
        let l = UILabel()
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = CustomColor.customBlack
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    let starImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "star")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = CustomColor.customBlack
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.addSubview(cardImage)
        cardView.fillSuperview()
        cardView.addSubview(cardName)
        cardView.addSubview(starImage)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            cardImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            cardImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            cardImage.heightAnchor.constraint(equalToConstant: 110),
            
            cardName.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 15),
            cardName.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 7),
            
            starImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            starImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -15),
            starImage.widthAnchor.constraint(equalToConstant: 20),
            starImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        cardImage.image = UIImage(named: data.img)
        cardName.text = data.username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
