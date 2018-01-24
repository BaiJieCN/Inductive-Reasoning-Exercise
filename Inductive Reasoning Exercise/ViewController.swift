//
//  ViewController.swift
//  Inductive Reasoning Exercise
//
//  Created by BaiJie on 12/18/17.
//  Copyright © 2017 BaiJie. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var window: UIWindow?
    var btnNo: Int?
    var scorehistory:[ScoreHistory]? = nil

    
    override func viewDidLoad() {
        
        
//        if coreDatahandler.saveObject(score: 80, date: Date()) {
//            scorehistory = coreDatahandler.fetchObject()
//
//            for i in scorehistory!{
//                print(i.score)
//            }
//        }
        
        super.viewDidLoad()
        self.title="Inductive Reasoning"
        self.view.backgroundColor=UIColor.white
        setupViews()
    }

    
    @objc func btnGetStartedAction(sender: UIButton) {
        let v=QuizVC()
        if sender == btnGetStarted1 {
            v.numberOfquestions = 10
        } else if sender == btnGetStarted2 {
            v.numberOfquestions = 15
        } else if sender == btnGetStarted3 {
            v.numberOfquestions = 20
        }
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 400).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 100).isActive=true
        
        self.view.addSubview(btnGetStarted1)
        btnGetStarted1.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted1.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnGetStarted1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50).isActive=true
        
        self.view.addSubview(btnGetStarted2)
        btnGetStarted2.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted2.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnGetStarted2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20).isActive=true
        
        self.view.addSubview(btnGetStarted3)
        btnGetStarted3.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted3.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnGetStarted3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted3.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 90).isActive=true
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="Choose one question set"
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 28)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let btnGetStarted1: UIButton = {
        let btn=UIButton()
        btn.titleLabel?.adjustsFontSizeToFitWidth=true
        btn.setTitle("   Start with 10 Questions   ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.lightGray
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btn
    }()
    
    let btnGetStarted2: UIButton = {
        let btn=UIButton()
        btn.titleLabel?.adjustsFontSizeToFitWidth=true
        btn.setTitle("   Start with 15 Questions   ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.purple
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btn
    }()
    
    let btnGetStarted3: UIButton = {
        let btn=UIButton()
        btn.titleLabel?.adjustsFontSizeToFitWidth=true
        btn.setTitle("   Start with 20 Questions   ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btn
    }()
}



