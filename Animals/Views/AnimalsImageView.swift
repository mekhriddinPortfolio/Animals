//
//  AnimalsImageView.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 30/09/22.
//

import UIKit

class AnimalsImageView: UIImageView {
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.image = image
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds = true
        contentMode = .scaleAspectFit
    }
}
