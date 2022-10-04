//
//  AnimalsLabel.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 30/09/22.
//

import UIKit

class AnimalsLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(text: String, textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
    
    private func configure() {
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textColor = UIColor.label
    }
}
