//
//  CustomHeaderView.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit


struct CustomFont {
    static let anodinaExtraBold = "Anodina-ExtraBold"
}

struct CustomColor {
    static let customBlack = UIColor(red: 32/255, green: 30/255, blue: 42/255, alpha: 1)
    static let appBackground = UIColor(red: 239/255, green: 240/255, blue: 242/255, alpha: 1)
    
    static let gd1_1 = UIColor(red: 47/255, green: 128/255, blue: 237/255, alpha: 1)
    static let gd1_2 = UIColor(red: 86/255, green: 204/255, blue: 242/255, alpha: 1)
    
    static let gd2_1 = UIColor(red: 249/255, green: 212/255, blue: 35/255, alpha: 1)
    static let gd2_2 = UIColor(red: 230/255, green: 92/255, blue: 0/255, alpha: 1)
    
    static let gd3_1 = UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1)
    static let gd3_2 = UIColor(red: 236/255, green: 110/255, blue: 173/255, alpha: 1)
}


struct CardDetails {
    let cardImage:String!
    let amount:String!
    let number1:String!
    let number2:String!
    let number3:String!
    let number4:String!
    let gradient:[CGColor]!
}


class CustomHeaderView: UIView {
    
    var data = [CardDetails]()
    
    let headerTitle:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Overview"
        l.textColor = CustomColor.customBlack
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 25)
        return l
    }()
    
    let addButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 13
        btn.backgroundColor = .white
        btn.layer.shadowColor = UIColor(white: 0, alpha: 0.04).cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 0)
        btn.layer.shadowRadius = 13
        btn.layer.shadowOpacity = 1
        btn.setImage(UIImage(named: "add"), for: .normal)
        return btn
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: "CardsCollectionViewCell")
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    let pageControl:UIPageControl = {
        let pg = UIPageControl()
        pg.translatesAutoresizingMaskIntoConstraints = false
        pg.pageIndicatorTintColor = .lightGray
        pg.currentPageIndicatorTintColor = CustomColor.customBlack
        return pg
    }()
    
    let bottomView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let expenseLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Expenses"
        l.font = UIFont(name:CustomFont.anodinaExtraBold, size: 19)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let expenseBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = CustomColor.customBlack
        return btn
    }()
    
    let allBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.tintColor = CustomColor.customBlack
        return btn
    }()
    
    let allLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "All"
        l.font = UIFont(name:CustomFont.anodinaExtraBold, size: 19)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = CustomColor.appBackground
        addSubview(headerTitle)
        addSubview(addButton)
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(bottomView)
        bottomView.addSubview(allLabel)
        bottomView.addSubview(allBtn)
        bottomView.addSubview(expenseLabel)
        bottomView.addSubview(expenseBtn)
        setUpConstraints()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        
        data = [
            CardDetails(cardImage: "mastercard", amount: "$ 12,769.00", number1: "6958", number2: "4785", number3: "5200", number4: "3687", gradient: [CustomColor.gd1_1.cgColor , CustomColor.gd1_2.cgColor]),
            CardDetails(cardImage: "apple", amount: "$ 12,769.00", number1: "6958", number2: "1254", number3: "9812", number4: "9343", gradient: [CustomColor.gd2_1.cgColor , CustomColor.gd2_2.cgColor]),
            CardDetails(cardImage: "visa", amount: "$ 12,769.00", number1: "8912", number2: "1924", number3: "9811", number4: "1234", gradient: [CustomColor.gd3_1.cgColor , CustomColor.gd3_2.cgColor])
        ]
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 12.5),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: headerTitle.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 40),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            expenseLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            expenseLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            expenseBtn.leadingAnchor.constraint(equalTo: expenseLabel.trailingAnchor, constant: 4),
            expenseBtn.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            expenseBtn.widthAnchor.constraint(equalToConstant: 20),
            expenseBtn.heightAnchor.constraint(equalToConstant: 20),
            
            allLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            allLabel.trailingAnchor.constraint(equalTo: allBtn.leadingAnchor, constant: -4),
            
            allBtn.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            allBtn.widthAnchor.constraint(equalToConstant: 20),
            allBtn.heightAnchor.constraint(equalToConstant: 20),
            allBtn.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30)
        ])
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / collectionView.frame.width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomHeaderView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsCollectionViewCell", for: indexPath) as! CardsCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
