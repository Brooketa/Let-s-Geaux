import Combine

protocol NewsUseCaseProtocol {

    func fetchNews() -> AnyPublisher<[NewsUseCaseModel], Error>

}
