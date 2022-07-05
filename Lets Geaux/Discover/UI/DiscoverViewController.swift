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
        collectionView.delegate = self
        newsDataSource = makeNewsDataSource()

        getNews()
    }

    private func getNews() {
        discoverPresenter
            .fetchNews()
            .sink(receiveCompletion: { completion in
                switch(completion) {
                case .failure(let error):
                    print(error)
                    break
                case .finished:
                    //Do nothing
                    break
                }
            }, receiveValue: { [weak self] newsViewModels in
                guard let self = self else { return }

                self.updateNewsDataSource(with: newsViewModels, for: .whatsUp)
            })
            .store(in: &cancellables)
    }

    private func updateNewsDataSource(with viewModels: [NewsViewModel], for section: DiscoverSection) {
        newsSnapshot.deleteItems(newsSnapshot.itemIdentifiers(inSection: section))
        newsSnapshot.appendItems(viewModels, toSection: section)
        newsDataSource.apply(newsSnapshot, animatingDifferences: false, completion: nil)
    }

    private func makeNewsDataSource() -> NewsDataSource {
        let newsDataSource = NewsDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, newsViewModel in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: DiscoverCollectionViewCell.identifier,
                        for: indexPath) as? DiscoverCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(with: newsViewModel)

                return cell
            })

        newsDataSource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) in
            guard let self = self else { return nil }

            guard
                let header = self.getHomeSectionHeader(
                collectionView: collectionView,
                kind: kind,
                indexPath: indexPath)
            else {
                return nil
            }

            return header
        }

        newsSnapshot = NewsSnapshot()
        newsSnapshot.appendSections([.whatsUp])

        return newsDataSource
    }

    private func getHomeSectionHeader(
        collectionView: UICollectionView,
        kind: String,
        indexPath: IndexPath
    ) -> DiscoverCollectionViewSectionHeader? {

        guard
            let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: DiscoverCollectionViewSectionHeader.identifier,
            for: indexPath) as? DiscoverCollectionViewSectionHeader
        else {
            return nil
        }

        let section = self.newsDataSource.snapshot().sectionIdentifiers[indexPath.section]
        configureSectionHeader(sectionHeader: header, section: section)

        return header
    }

    private func configureSectionHeader(sectionHeader: DiscoverCollectionViewSectionHeader, section: DiscoverSection) {
        let sectionTitle: String

        switch section {
        case .whatsUp:
            sectionTitle = "What's Up"
        }

        sectionHeader.set(sectionTitle: sectionTitle)
    }

}

extension DiscoverViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = newsDataSource.itemIdentifier(for: indexPath) else { return }

        discoverPresenter.showNewsDetails(viewModel: viewModel)
    }

}

