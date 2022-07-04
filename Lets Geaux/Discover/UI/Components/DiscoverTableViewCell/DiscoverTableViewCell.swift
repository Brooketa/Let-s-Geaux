import UIKit

protocol DiscoverTableViewCellDelegate: AnyObject {
    func didSelectCell(indexPath:IndexPath)
}

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    static let cellIdentifier = "DiscoverTableViewCell"

    weak var delegate: DiscoverTableViewCellDelegate? = nil

    let layout = UICollectionViewFlowLayout()

    var news:[News] = [] {
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
        return UINib(nibName: "DiscoverTableViewCell", bundle: nil)
    }

    public func configure(news: [News], frameWidth: CGFloat) {
        self.news = news
        configureCollectionView(frameWidth: frameWidth)
    }

    private func configureCollectionView(frameWidth: CGFloat) {
        //Collection View delegate configuration
        collectionView.register(
            DiscoverCollectionViewCell.self,
            forCellWithReuseIdentifier: DiscoverCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        //Collection View appearance configuration
//        let itemSize = CGSize(width: frameWidth * DiscoverTableViewConstants.widthScaleFactor,
//                              height: frameWidth * DiscoverTableViewConstants.widthScaleFactor * DiscoverTableViewConstants.cellAspectRatio)
//
//        let insetSize = (frameWidth - frameWidth * DiscoverTableViewConstants.widthScaleFactor) / 2

        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
//        layout.itemSize = itemSize

        collectionView.collectionViewLayout = layout
        collectionView.decelerationRate = .fast
        collectionView.bounces = true
        collectionView.alwaysBounceHorizontal = true
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetSize, bottom: 0, right:  insetSize)
    }
}

//MARK: UICollectionViewDelegate

extension DiscoverTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(indexPath: indexPath)
    }
}

//MARK: UICollectionViewDataSource

extension DiscoverTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DiscoverCollectionViewCell.identifier,
            for: indexPath) as! DiscoverCollectionViewCell

        cell.set(with: news[indexPath.row])

        return cell
    }
}

//MARK: UIScrollViewDelegate

extension DiscoverTableViewCell: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout

        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing

        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing

        let roundedIndex = round(index)

        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
