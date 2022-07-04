import Combine
import UIKit

enum DiscoverSection {
    case whatsUp
}

class DiscoverViewController: UIViewController {

    typealias NewsDataSource = UICollectionViewDiffableDataSource<DiscoverSection, NewsViewModel>
    typealias NewsSnapshot = NSDiffableDataSourceSnapshot<DiscoverSection, NewsViewModel>

    var collectionView: UICollectionView!

    private var discoverPresenter: DiscoverPresenter
    private var newsDataSource: NewsDataSource!
    private var newsSnapshot: NewsSnapshot!

    private var cancellables = Set<AnyCancellable>()

    init(presenter: DiscoverPresenter) {
        discoverPresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

}

