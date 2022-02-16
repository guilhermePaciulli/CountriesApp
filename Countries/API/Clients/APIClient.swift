import Combine
import Foundation

protocol URLSessionPublishable {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionPublishable { }

class APIClient {
    let session: URLSessionPublishable = URLSession.shared
    
    func dispatch<T: Codable>(request: URLRequest) -> AnyPublisher<T, APIError> {
        session.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> T in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.timeout
                }
                if 200...299 ~= httpResponse.statusCode {
                    do {
                        return try JSONDecoder().decode(T.self, from: data)
                    } catch let error {
                        print(error)
                        throw APIError.jsonConversionFailure
                    }
                } else if let decodedError = try? JSONDecoder().decode(APIError.self, from: data) {
                    throw decodedError
                } else {
                    throw APIError.generic
                }
            }
            .castUnknownErrorsAs(defaultError: .generic)
            .eraseToAnyPublisher()
            
    }
}
