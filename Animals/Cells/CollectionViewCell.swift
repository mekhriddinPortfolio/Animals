//
//  CollectionViewCell.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 30/09/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cellID"
    
    let animalImageView = AnimalsImageView(image: UIImage(named: "lion")!)
    let animalName = AnimalsLabel(text: "Lion", textAlignment: .center, fontSize: 20, weight: .bold)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addSubview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = UIColor.init(hex: "000000").withAlphaComponent(0.1)
        layer.cornerRadius = 20
    }
    
    private func addSubview() {
        addSubview(animalImageView)
        addSubview(animalName)
    }
    
    private func setConstraints() {
        animalImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-40)
        }
        
        animalName.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(animalImageView.snp.bottom)
        }
        
    }
    
    func setAnimalImage(image: UIImage, name: String) {
        animalImageView.image = image
        animalName.text = name
    }
    
}
