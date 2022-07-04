import Combine

protocol NewsRepositoryProtocol {

    func fetchNews() -> AnyPublisher<[NewsRepositoryModel], Error>

}
