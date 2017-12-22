//
//  QuizVC.swift
//  Inductive Reasoning Exercise
//
//  Created by BaiJie on 12/18/17.
//  Copyright © 2017 BaiJie. All rights reserved.
//

import UIKit

struct Question {
    let imgName: String
    let questionText: String
    let options: [String]
    let correctAns: Int
    var wrongAns: Int
    var selectedAns: Int?
    var isAnswered: Bool
}

class QuizVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var numberOfquestions : Int?
    
    var myCollectionView: UICollectionView!
    var questionsArrayOrg = [Question]()
    var questionsArray = [Question]()
    var score: Int = 0
    var currentQuestionNumber = 1
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=""
        self.view.backgroundColor=UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        myCollectionView=UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(QuizCVCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor=UIColor.white
        myCollectionView.isPagingEnabled = true
        
        self.view.addSubview(myCollectionView)
        
  
        let question1 = Question(imgName: "IR1", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 3, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question2 = Question(imgName: "IR2", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 3, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question3 = Question(imgName: "IR3", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 0, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question4 = Question(imgName: "IR4", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 0, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question5 = Question(imgName: "IR5", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 4, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question6 = Question(imgName: "IR6", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 0, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question7 = Question(imgName: "IR7", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 3, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question8 = Question(imgName: "IR8", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 0, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question9 = Question(imgName: "IR9", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 3, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question10 = Question(imgName: "IR10", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 1, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question11 = Question(imgName: "IR11", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 4, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question12 = Question(imgName: "IR12", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 2, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question13 = Question(imgName: "IR13", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 3, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question14 = Question(imgName: "IR14", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 2, wrongAns: -1, selectedAns: -1, isAnswered: false)
        let question15 = Question(imgName: "IR15", questionText: "Choose the image that completes the pattern", options: ["A", "B", "C", "D", "E"], correctAns: 0, wrongAns: -1, selectedAns: -1, isAnswered: false)

        questionsArrayOrg = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15]
        
        questionsArrayOrg = questionsArrayOrg.shuffle()
        
        questionsArray = Array(questionsArrayOrg.prefix(numberOfquestions!))
        
        setupViews()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! QuizCVCell
        cell.question=questionsArray[indexPath.row]
        cell.delegate=self
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setQuestionNumber()
    }
    
    func setQuestionNumber() {
        let x = myCollectionView.contentOffset.x
        let w = myCollectionView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage < questionsArray.count {
            lblQueNumber.text = "Question: \(currentPage+1) / \(questionsArray.count)"
            currentQuestionNumber = currentPage + 1
        }
    }
    
    @objc func btnPrevNextAction(sender: UIButton) {
    
        
        if sender == btnNext && currentQuestionNumber == questionsArray.count {
            let v=ResultVC()
            v.score = score
            v.totalScore = questionsArray.count
            self.navigationController?.pushViewController(v, animated: false)
            return
        }
        
        let collectionBounds = self.myCollectionView.bounds
        var contentOffset: CGFloat = 0
        if sender == btnNext {
            contentOffset = CGFloat(floor(self.myCollectionView.contentOffset.x + collectionBounds.size.width))
            currentQuestionNumber += currentQuestionNumber >= questionsArray.count ? 0 : 1
            
            if currentQuestionNumber == questionsArray.count {
                btnNext.setTitle("Submit >", for: .normal)
            }

        } else {
            btnNext.setTitle("Next >", for: .normal)
            contentOffset = CGFloat(floor(self.myCollectionView.contentOffset.x - collectionBounds.size.width))
            currentQuestionNumber -= currentQuestionNumber <= 1 ? 0 : 1
        }
        self.moveToFrame(contentOffset: contentOffset)
        lblQueNumber.text = "Question: \(currentQuestionNumber) / \(questionsArray.count)"
    }
    
    func moveToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset ,y : self.myCollectionView.contentOffset.y ,width : self.myCollectionView.frame.width,height : self.myCollectionView.frame.height)
        self.myCollectionView.scrollRectToVisible(frame, animated: true)
    }
    
    func setupViews() {
        myCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive=true
        myCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        myCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
        
        self.view.addSubview(btnPrev)
        btnPrev.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnPrev.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive=true
        btnPrev.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        btnPrev.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive=true
        
        self.view.addSubview(btnNext)
        btnNext.heightAnchor.constraint(equalTo: btnPrev.heightAnchor).isActive=true
        btnNext.widthAnchor.constraint(equalTo: btnPrev.widthAnchor).isActive=true
        btnNext.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        btnNext.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive=true
        
        self.view.addSubview(lblQueNumber)
        lblQueNumber.heightAnchor.constraint(equalToConstant: 20).isActive=true
        lblQueNumber.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblQueNumber.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive=true
        lblQueNumber.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive=true
        lblQueNumber.text = "Question: \(1) / \(questionsArray.count)"
        
//don't show the result before last page
//        self.view.addSubview(lblScore)
//        lblScore.heightAnchor.constraint(equalTo: lblQueNumber.heightAnchor).isActive=true
//        lblScore.widthAnchor.constraint(equalTo: lblQueNumber.widthAnchor).isActive=true
//        lblScore.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive=true
//        lblScore.bottomAnchor.constraint(equalTo: lblQueNumber.bottomAnchor).isActive=true
//        lblScore.text = "Score: \(score) / \(questionsArray.count)"
    }
    
    let btnPrev: UIButton = {
        let btn=UIButton()
        btn.setTitle("< Previous", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    let btnNext: UIButton = {
        let btn=UIButton()
        btn.setTitle("Next >", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.purple
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    let lblQueNumber: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.textColor=UIColor.gray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblScore: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.textColor=UIColor.gray
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
}

extension Array{
    public func shuffle() -> Array {
        var list = self
        for index in 0..<list.count {
            let newIndex = Int(arc4random_uniform(UInt32(list.count-index))) + index
            if index != newIndex {
                list.swapAt(index, newIndex)
            }
        }
        return list
    }
}


extension QuizVC: QuizCVCellDelegate {
    func didChooseAnswer(btnIndex: Int) {
        let centerIndex = getCenterIndex()
        guard let index = centerIndex else { return }
        questionsArray[index.item].isAnswered=true
        questionsArray[index.item].selectedAns = btnIndex
        
        if questionsArray[index.item].correctAns != questionsArray[index.item].selectedAns {
//            questionsArray[index.item].wrongAns = btnIndex
//            score -= 1
            score += 0
        } else {
            score += 1
        }
        lblScore.text = "Score: \(score) / \(questionsArray.count)"
        myCollectionView.reloadItems(at: [index])
    }
    
    func getCenterIndex() -> IndexPath? {
        let center = self.view.convert(self.myCollectionView.center, to: self.myCollectionView)
        let index = myCollectionView!.indexPathForItem(at: center)
        print(index ?? "index not found")
        return index
    }
}
