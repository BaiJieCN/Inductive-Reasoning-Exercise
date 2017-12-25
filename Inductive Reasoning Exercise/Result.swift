//
//  Result.swift
//  Inductive Reasoning Exercise
//
//  Created by BaiJie on 12/18/17.
//  Copyright © 2017 BaiJie. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    var score: Int?
    var totalScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        setupViews()
    }
    
    func showRating() {
        var rating: String?
        var color = UIColor.black
        guard let sc = score, let tc = totalScore else { return }
        let s = sc * 100 / tc
        
        if s < 30 {
            rating = "Poor"
            color = UIColor.blue
        }  else if s < 60 {
            rating = "Average"
            color = UIColor.blue
        } else if s < 80 {
            rating = "Good"
            color = UIColor.blue
        } else if s < 90 {
            rating = "Excellent"
            color = UIColor.blue
        } else if s <= 100 {
            rating = "Outstanding"
            color = UIColor.blue
        }
        lblRating.text = "You beated \(s)% of the population!"
        lblRating.textColor=color
        
        let coreDatasaveresult = coreDatahandler.saveObject(score: s, date: Date())
        if !coreDatasaveresult {
            print("Save data error")
        }
        
        let scorehistory = coreDatahandler.fetchObject()
        
        for i in scorehistory!{
            print(i.score, i.date!)
        }
    }
    
    @objc func btnRestartAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
        
        self.view.addSubview(lblScore)
        lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 40).isActive=true
        lblScore.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblScore.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblScore.heightAnchor.constraint(equalToConstant: 60).isActive=true
        lblScore.text = "\(score!) / \(totalScore!)"
        
        self.view.addSubview(lblRating)
        lblRating.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 40).isActive=true
        lblRating.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblRating.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblRating.heightAnchor.constraint(equalToConstant: 60).isActive=true
        showRating()
        
        self.view.addSubview(btnRestart)
        btnRestart.topAnchor.constraint(equalTo: lblRating.bottomAnchor, constant: 40).isActive=true
        btnRestart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnRestart.widthAnchor.constraint(equalToConstant: 150).isActive=true
        btnRestart.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnRestart.addTarget(self, action: #selector(btnRestartAction), for: .touchUpInside)
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="Your Score"
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 46)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblScore: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblRating: UILabel = {
        let lbl=UILabel()
        lbl.text="Good"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let btnRestart: UIButton = {
        let btn = UIButton()
        btn.setTitle("Restart", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.layer.cornerRadius=5
        btn.clipsToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
}

