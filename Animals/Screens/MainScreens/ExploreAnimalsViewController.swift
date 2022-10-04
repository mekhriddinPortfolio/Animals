//
//  ExploreAnimalsViewController.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 30/09/22.
//

import UIKit

class ExploreAnimalsViewController: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        self.navigationItem.title = "Explore Animals"
        
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CreateFlowLayout.createFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    func transform(cell: UICollectionViewCell) {
        let coverFrame = cell.convert(cell.bounds, to: self.view)
        
        let transformOffsetY = collectionView.bounds.height * 2 / 3
        let percent = getPercent(value: (coverFrame.minY - transformOffsetY) / (collectionView.bounds.height - transformOffsetY))
        
        let maxScaleDifference: CGFloat = 0.2
        let scale = percent * maxScaleDifference
        
        cell.transform = CGAffineTransform(scaleX: 1 - scale, y: 1 - scale)
        cell.alpha = 1 - percent
    }

    func getPercent(value: CGFloat) -> CGFloat {
        let lBound: CGFloat = 0
        let UBound: CGFloat = 1
        
        if value < lBound {
            return lBound
        } else if value > UBound {
            return UBound
        }
        return value
    }
}

extension ExploreAnimalsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(animals.count)
        return animals.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        DispatchQueue.main.async {
            cell.setAnimalImage(image: animals[indexPath.row].image, name: animals[indexPath.row].name)
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.visibleCells.forEach { transform(cell: $0) }
    }
    
}


