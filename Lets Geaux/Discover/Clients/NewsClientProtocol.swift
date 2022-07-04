import Combine

protocol NewsClientProtocol {

    func fetchNews() -> AnyPublisher<[NewsClientModel], Error>

}
