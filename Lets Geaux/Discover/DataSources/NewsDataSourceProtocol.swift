import Combine

protocol NewsDataSourceProtocol {

    func fetchNews() -> AnyPublisher<[NewsDataModel], Error>

}
