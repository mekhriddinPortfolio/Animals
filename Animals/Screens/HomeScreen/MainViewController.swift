//
//  ViewController.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 30/09/22.
//

import UIKit
import SnapKit

let myScreen = UIScreen.main.bounds

class MainViewController: UIViewController {
    
    let mainImageView = AnimalsImageView(image: UIImage(named: "lionLogo")!)
    let mainLabel = AnimalsLabel(text: "Explore the Animal Kingdom",textAlignment: .center, fontSize: 22, weight: UIFont.Weight.bold)
    let learnAnimalsBtn = AnimalsButton(backgroundColor: UIColor.init(hex: "F92968"), title: "Explore Animals")
    let guessAnimalsBtn = AnimalsButton(backgroundColor: UIColor.init(hex: "F92968"), title: "Guess the Animals")
    let animalsQuizBtn = AnimalsButton(backgroundColor: UIColor.init(hex: "F92968"), title: "Take a quiz")
    let favoriteAnimalsBtn = AnimalsButton(backgroundColor: UIColor.init(hex: "F92968"), title: "Favorite Animals")

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setConstraints()
        addTargets()
        
    }
    
    private func addTargets() {
        learnAnimalsBtn.addTarget(self, action: #selector(learnAnimalsBtnTapped), for: .touchUpInside)
        guessAnimalsBtn.addTarget(self, action: #selector(guessAnimalsBtnTpped), for: .touchUpInside)
        animalsQuizBtn.addTarget(self, action: #selector(animalsQuizBtnTapped), for: .touchUpInside)
        favoriteAnimalsBtn.addTarget(self, action: #selector(favoriteAnimalsBtnTapped), for: .touchUpInside)
    }
    
    @objc func learnAnimalsBtnTapped() {
        let vc = ExploreAnimalsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func guessAnimalsBtnTpped() {
        let vc = GuessAnimalsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func animalsQuizBtnTapped() {
        let vc = TakeQuizViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func favoriteAnimalsBtnTapped() {
        let vc = FavoriteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.systemBackground
    }
    
    private func addSubviews() {
        view.addSubview(mainImageView)
        view.addSubview(mainLabel)
        view.addSubview(learnAnimalsBtn)
        view.addSubview(animalsQuizBtn)
        view.addSubview(guessAnimalsBtn)
        view.addSubview(favoriteAnimalsBtn)
    }
    
    private func setConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(myScreen.height / 3.2)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(27)
        }
        
        learnAnimalsBtn.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(50)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
        
        guessAnimalsBtn.snp.makeConstraints { make in
            make.top.equalTo(learnAnimalsBtn.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
        
        animalsQuizBtn.snp.makeConstraints { make in
            make.top.equalTo(guessAnimalsBtn.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
        
        favoriteAnimalsBtn.snp.makeConstraints { make in
            make.top.equalTo(animalsQuizBtn.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
    }
}

