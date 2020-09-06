//
//  ExpensesCollectionViewCell.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class ExpensesCollectionViewCell: UICollectionViewCell {
    
    var data:ExpenseData?{
        didSet{
            manageData()
        }
    }
    
    lazy var imageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        img.layer.cornerRadius = 20
        img.constrainWidth(constant: 60)
//        img.constrainHeight(constant: 60)
        return img
    }()
    
    lazy var  descLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = CustomColor.customBlack
        l.numberOfLines = 0
        return l
    }()
    
    lazy var  priceLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Poppins-Medium", size: 17)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let ff = hstack(descLabel,UIView(),priceLabel).withMargins(.init(top: 8, left: 0, bottom: 8, right: 16))
        
        hstack(imageView,ff,spacing:16).withMargins(.allSides(8))
    }
    
    func setAttributedText(_ title:String , _ date:String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string:"\(title)\n" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        attributedText.append(NSAttributedString(string: "\(date)" , attributes:
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        return attributedText
    }
    
    func manageData(){
        guard let data = data else {return}
        descLabel.attributedText = setAttributedText(data.title, data.date)
        priceLabel.text = data.price
        imageView.image = UIImage(named: data.img)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = CustomColor.customBlack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
