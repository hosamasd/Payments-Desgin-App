//
//  TransferViewController.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

struct UserData {
    let img:String!
    let username:String!
}

class TransferViewController: UIViewController {

    var data = [UserData]()
    
    lazy var headerView:CustomTransferHeaderView = {
        let v = CustomTransferHeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.controller = self
        v.layer.cornerRadius = 40
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCollectionViewCell")
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        cv.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        return cv
    }()
    
    let amountTitle:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Amount"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 18)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let amountView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        return v
    }()
    
    let amountLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "$ 0.00"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 16)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.spacing = 15
        v.distribution = .fillEqually
        v.axis = .horizontal
        return v
    }()
    
    let view1:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 25
        return v
    }()
    
    let label1:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "$ 25"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let view2:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 25
        return v
    }()
    
    let label2:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "$ 50"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let view3:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 25
        return v
    }()
    
    let label3:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "$ 100"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let view4:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 25
        return v
    }()
    
    let label4:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "$ 200"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = CustomColor.customBlack
        return l
    }()
    
    let reasonView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        return v
    }()
    
    let reasonLabel:UILabel = {
        let l = UILabel()
        l.text = "Reason:"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let dividerView:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let paymentLabel:UILabel = {
        let l = UILabel()
        l.text = "Payment"
        l.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let sendBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Send", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = CustomColor.customBlack
        btn.layer.cornerRadius = 20
        btn.titleLabel?.font = UIFont(name: CustomFont.anodinaExtraBold, size: 15)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.appBackground
        view.addSubview(headerView)
        view.addSubview(collectionView)
        view.addSubview(amountTitle)
        view.addSubview(amountView)
        amountView.addSubview(amountLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(view1)
        view1.addSubview(label1)
        stackView.addArrangedSubview(view2)
        view2.addSubview(label2)
        stackView.addArrangedSubview(view3)
        view3.addSubview(label3)
        stackView.addArrangedSubview(view4)
        view4.addSubview(label4)
        view.addSubview(reasonView)
        reasonView.addSubview(reasonLabel)
        reasonView.addSubview(dividerView)
        reasonView.addSubview(paymentLabel)
        view.addSubview(sendBtn)
        
        setUpConstraints()
        data = [
            UserData(img: "prof-img4", username: "Melinda\nMay"),
            UserData(img: "prof-img5", username: "Philip\nCoulson"),
            UserData(img: "prof-img6", username: "Jack\nRyan"),
            UserData(img: "prof-img7", username: "Ronnie\nScrewala")
        ]
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 230),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 230),
            
            amountTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            amountTitle.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            
            amountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            amountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            amountView.heightAnchor.constraint(equalToConstant: 55),
            amountView.topAnchor.constraint(equalTo: amountTitle.bottomAnchor, constant: 15),
            
            amountLabel.leadingAnchor.constraint(equalTo: amountView.leadingAnchor, constant: 20),
            amountLabel.centerYAnchor.constraint(equalTo: amountView.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: amountView.bottomAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            label1.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            label1.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            
            label2.centerYAnchor.constraint(equalTo: view2.centerYAnchor),
            label2.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            
            label3.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            label3.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            
            label4.centerYAnchor.constraint(equalTo: view4.centerYAnchor),
            label4.centerXAnchor.constraint(equalTo: view4.centerXAnchor),
            
            reasonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            reasonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            reasonView.heightAnchor.constraint(equalToConstant: 55),
            reasonView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            
            reasonLabel.leadingAnchor.constraint(equalTo: reasonView.leadingAnchor, constant: 20),
            reasonLabel.centerYAnchor.constraint(equalTo: reasonView.centerYAnchor),
            
            dividerView.leadingAnchor.constraint(equalTo: reasonLabel.trailingAnchor, constant: 15),
            dividerView.topAnchor.constraint(equalTo: reasonView.topAnchor, constant: 10),
            dividerView.bottomAnchor.constraint(equalTo: reasonView.bottomAnchor, constant: -10),
            dividerView.widthAnchor.constraint(equalToConstant: 2),
            
            paymentLabel.leadingAnchor.constraint(equalTo: dividerView.leadingAnchor, constant: 20),
            paymentLabel.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor),
            
            sendBtn.topAnchor.constraint(equalTo: reasonView.bottomAnchor, constant: 20),
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            sendBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func backBtnPressed(){
        dismiss(animated: true, completion: nil)
    }
}

extension TransferViewController:UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 185)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
