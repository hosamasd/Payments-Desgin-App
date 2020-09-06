//
//  HomeViewController.swift
//  Payments Desgin App
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

struct ExpenseData {
    let img:String!
    let title:String!
    let date:String!
    let price:String!
}

class HomeViewController: UIViewController {
    
    var data = [
        ExpenseData(img: "img1", title: "Spotify", date: "Sep 4 - 12:30 PM", price: "- $ 11,99"),
        ExpenseData(img: "img2", title: "Spotify", date: "Sep 4 - 12:30 PM", price: "- $ 11,99"),
        ExpenseData(img: "img3", title: "Spotify", date: "Sep 4 - 12:30 PM", price: "- $ 11,99"),
        ExpenseData(img: "img4", title: "Spotify", date: "Sep 4 - 12:30 PM", price: "- $ 11,99"),
    ]
    
    lazy var headerView:CustomHeaderView = {
        let v = CustomHeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.constrainHeight(constant: 300)
        return v
    }()
    
    lazy var bottomView:CustomBottomView = {
        let v = CustomBottomView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.constrainHeight(constant: 100)
        v.transferButton.addTarget(self, action: #selector(handleASD), for: .touchUpInside)
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(ExpensesCollectionViewCell.self, forCellWithReuseIdentifier: "ExpensesCollectionViewCell")
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CustomColor.appBackground
        view.stack(headerView,collectionView,bottomView).withMargins(.init(top: 0, left: 0, bottom: 20, right: 0))

    }
    
    @objc func handleASD(){
        let VC = TransferViewController()
        VC.modalTransitionStyle = .crossDissolve
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
    }

}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpensesCollectionViewCell", for: indexPath) as! ExpensesCollectionViewCell
        cell.data = data[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70)
    }

}
