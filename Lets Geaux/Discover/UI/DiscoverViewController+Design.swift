import UIKit
import SnapKit

struct DiscoverCollectionViewConstants {
    static let widthScaleFactor:CGFloat = 0.8
    static let cellAspectRatio:CGFloat = 1.2
}

extension DiscoverViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())

        collectionView.register(
            DiscoverCollectionViewSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: DiscoverCollectionViewSectionHeader.identifier)

        collectionView.register(
            DiscoverCollectionViewCell.self,
            forCellWithReuseIdentifier: DiscoverCollectionViewCell.identifier)

        view.addSubview(collectionView)
    }
    
    func styleViews() {
        defaultNavigationAppearance()
        title = "Discover"
        view.backgroundColor = AppearanceUtils.lightGrey

        collectionView.backgroundColor = AppearanceUtils.lightGrey
        collectionView.showsVerticalScrollIndicator = false
    }

    func defineLayoutForViews() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(50))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.88),
                heightDimension: .fractionalWidth(1)),
            subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        section.boundarySupplementaryItems = [sectionHeader]

        return UICollectionViewCompositionalLayout(section: section)
    }
}
