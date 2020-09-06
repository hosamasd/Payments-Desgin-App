//
//  CardsCollectionViewCell.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    
    var data:CardDetails?{
        didSet{
            manageData()
        }
    }
    
    let backgroundCardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 27
        return v
    }()
    
    let cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.cornerRadius = 27
        return v
    }()
    
    let chipBackgroundView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v.layer.cornerRadius = 18
        return v
    }()
    
    let chipBackImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "chip")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "apple")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let amountLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "$ 12,769.00"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 35)
        l.textColor = .white
        return l
    }()
    
    let stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.spacing = 20
        return v
    }()
    
    let number1:UILabel = {
        let l = UILabel()
        l.text = "6958"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 25)
        l.textAlignment = .center
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let number2:UILabel = {
        let l = UILabel()
        l.text = "4785"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 25)
        l.textAlignment = .center
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let number3:UILabel = {
        let l = UILabel()
        l.text = "5200"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 25)
        l.textAlignment = .center
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let number4:UILabel = {
        let l = UILabel()
        l.text = "3687"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 25)
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundCardView)
        addSubview(cardView)
        cardView.addSubview(chipBackgroundView)
        chipBackgroundView.addSubview(chipBackImage)
        cardView.addSubview(cardImage)
        cardView.addSubview(amountLabel)
        cardView.addSubview(stackView)
        stackView.addArrangedSubview(number1)
        stackView.addArrangedSubview(number2)
        stackView.addArrangedSubview(number3)
        stackView.addArrangedSubview(number4)
        setUpConstraints()
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            backgroundCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            backgroundCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            backgroundCardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            backgroundCardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            chipBackgroundView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 25),
            chipBackgroundView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25),
            chipBackgroundView.widthAnchor.constraint(equalToConstant: 60),
            chipBackgroundView.heightAnchor.constraint(equalToConstant: 50),
            
            chipBackImage.widthAnchor.constraint(equalToConstant: 40),
            chipBackImage.heightAnchor.constraint(equalToConstant: 40),
            chipBackImage.centerYAnchor.constraint(equalTo: chipBackgroundView.centerYAnchor),
            chipBackImage.centerXAnchor.constraint(equalTo: chipBackgroundView.centerXAnchor),
            
            cardImage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            cardImage.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 15),
            cardImage.widthAnchor.constraint(equalToConstant: 60),
            cardImage.heightAnchor.constraint(equalToConstant: 60),
            
            amountLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 25),
            amountLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -25),
            
            stackView.bottomAnchor.constraint(equalTo: amountLabel.topAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -25),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func manageData(){
        guard let data = data else { return }
        backgroundCardView.createGradientLayer(colors: data.gradient, view: backgroundCardView)
        amountLabel.text = data.amount
        number1.text = data.number1
        number2.text = data.number2
        number3.text = data.number3
        number4.text = data.number4
        cardImage.image = UIImage(named: data.cardImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
