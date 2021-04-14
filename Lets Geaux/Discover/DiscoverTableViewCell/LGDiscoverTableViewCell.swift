//
//  LGDiscoverTableViewCell.swift
//  Lets Geaux
//
//  Created by Brooketa on 13.04.2021..
//

import UIKit

class LGDiscoverTableViewCell: UITableViewCell {
    

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let layout = UICollectionViewFlowLayout()
    
    static let cellIdentifier = "LGDiscoverTableViewCell"
    
    var news:[LGNews] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "LGDiscoverTableViewCell", bundle: nil)
    }
    
    public func configure(news: [LGNews], frameWidth: CGFloat) {
        self.news = news
        configureCollectionView(frameWidth: frameWidth)
    }
    
    private func configureCollectionView(frameWidth: CGFloat) {
        //Collection View delegate configuration
        collectionView.register(LGWhatsUpCollectionViewCell.nib(), forCellWithReuseIdentifier: LGWhatsUpCollectionViewCell.cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Collection View appearance configuration
        let itemSize = CGSize(width: frameWidth * 0.8, height: frameWidth * 0.8 * 1.2)
        let insetSize = (frameWidth - frameWidth * 0.8) / 2

        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.itemSize = itemSize
        
        collectionView.collectionViewLayout = layout
        collectionView.decelerationRate = .fast
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetSize, bottom: 0, right:  insetSize)
    }
}

extension LGDiscoverTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension LGDiscoverTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LGWhatsUpCollectionViewCell.cellIdentifier, for: indexPath) as! LGWhatsUpCollectionViewCell
        cell.configure(with: news[indexPath.row])

        return cell
    }
}

extension LGDiscoverTableViewCell: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout

//        print("Line space \(layout.minimumLineSpacing)")
//        print("Width \(layout.itemSize.width)")

        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing

        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing

        let roundedIndex = round(index)

        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
