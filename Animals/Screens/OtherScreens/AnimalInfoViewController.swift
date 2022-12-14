//
//  AnimalInfoViewController.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 01/10/22.
//

import AVFoundation
import UIKit

class AnimalInfoViewController: UIViewController {
    
    var index: Int = 0
    var isFavorite = false
    
    lazy var animalImageView = AnimalsImageView(image: animals[self.index].image)
    lazy var animalNameLabel = AnimalsLabel(text: animals[self.index].name, textAlignment: .center, fontSize: 20, weight: .bold)
    lazy var animalInfoLabel = AnimalsLabel(text: animals[self.index].info, textAlignment: .center, fontSize: 13, weight: .medium)
    lazy var massLabel = AnimalsLabel(text: "Mass: " + animals[self.index].mass, textAlignment: .center, fontSize: 16, weight: .medium)
    lazy var lifeSpanLabel = AnimalsLabel(text: "Lifespan: " + animals[self.index].lifeSpan, textAlignment: .center, fontSize: 16, weight: .medium)
    lazy var favoriteBtn = AnimalsButton(backgroundColor: UIColor.init(hex: "F92968"), title: isFavorite ? "Remove from Favorites" : "Add to Favorites")
    lazy var learnPronunciationLabel = AnimalsLabel(text: "Learn Pronunciation", textAlignment: .center, fontSize: 16, weight: .bold)
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "play.circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    lazy var pronunciationLabel = AnimalsLabel(text: animals[self.index].pronounce, textAlignment: .center, fontSize: 16, weight: .bold)
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.systemBackground
        addSubviews()
        setConstraints()
        addTargets()
    }
    
    private func addTargets() {
        favoriteBtn.addTarget(self, action: #selector(favoriteBtnTapped), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
    }
    
    @objc func favoriteBtnTapped() {
        fetchLocalStorageForDownload()
        if isFavorite {
            let name:[String: String] = ["name": animals[index].name]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: name)
            navigationController?.popViewController(animated: true)
            self.presentAlertOnMainThread(title: "Success", message: "\(animals[index].name) has been removed from Favorites successfully", buttonTitle: "OK")
            return
        }
        for fav in favorites {
            if fav.name == animals[index].name {
                self.presentAlertOnMainThread(title: "Warning", message: "\(animals[self.index].name) already exists in Favorites", buttonTitle: "OK")
                return
            }
        }
        DataPersistanceManager.shared.downloadFavoriteWith(model: animals[index]) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("Add to favorites"), object: nil)
                self.presentAlertOnMainThread(title: "Success", message: "\(animals[self.index].name) has been added to Favorites successfully", buttonTitle: "OK")
            case .failure( _):
                self.presentAlertOnMainThread(title: "Failure", message: "\(animals[self.index].name) can not be added to Favorites.", buttonTitle: "OK")
            }
        }
    }
    
    private func fetchLocalStorageForDownload() {
        DataPersistanceManager.shared.fetchingFavoriteFromDataBase { result in
            switch result {
            case .success(let favorit):
                favorites = favorit
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func playTapped() {
        playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        
        let urlString = Bundle.main.path(forResource: animals[self.index].name.removeWhitespace(), ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else { return }
            
            if let url = URL(string: urlString) {
                player = try AVAudioPlayer(contentsOf: url)
            }
            
            guard let player = player else { return }
            
            player.play()
            player.delegate = self
        }
        catch {
            print("Something went wrong")
        }
    }
    
    private func addSubviews() {
        view.addSubview(animalImageView)
        view.addSubview(animalNameLabel)
        view.addSubview(animalInfoLabel)
        view.addSubview(massLabel)
        view.addSubview(lifeSpanLabel)
        view.addSubview(playButton)
        view.addSubview(learnPronunciationLabel)
        view.addSubview(favoriteBtn)
        view.addSubview(pronunciationLabel)
    }
    
    private func setConstraints() {
        animalImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(myScreen.height / 3.5)
        }
        
        animalNameLabel.snp.makeConstraints { make in
            make.top.equalTo(animalImageView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(25)
        }
        
        animalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(animalNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(myScreen.height / 5.5)
        }
        
        massLabel.snp.makeConstraints { make in
            make.top.equalTo(animalInfoLabel.snp.bottom).offset(myScreen.height / 42 / 2)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(20)
        }
        
        lifeSpanLabel.snp.makeConstraints { make in
            make.top.equalTo(massLabel.snp.bottom)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(20)
        }
        
        favoriteBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-myScreen.height / 20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        
        learnPronunciationLabel.snp.makeConstraints { make in
            make.top.equalTo(lifeSpanLabel.snp.bottom).offset(myScreen.height / 42 / 2)
            make.height.equalTo(20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalTo(learnPronunciationLabel.snp.bottom).offset(myScreen.height / 42 / 2)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(myScreen.height / 14)
            make.width.equalTo(myScreen.height / 14)
        }
        
        pronunciationLabel.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(myScreen.height / 42 / 2)
            make.height.equalTo(20)
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
        }
    }

}


extension AnimalInfoViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
        {
            player.stop()
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        }
}
