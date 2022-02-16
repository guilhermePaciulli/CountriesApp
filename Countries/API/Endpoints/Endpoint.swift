
import Foundation

protocol Endpoint {
    var request: URLRequest { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var path: String { get }
    var components: URLComponents { get }
    var host: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    
    var host: String {
        return "restcountries.com"
    }

    var defaultPath: String {
        "/v3.1"
    }

    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = defaultPath + path
        components.queryItems = queryItems
        return components
    }
    
    var url: URL {
        guard let url = components.url else {
            fatalError("Error when creating URL")
        }
        return url
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var method: RequestMethod {
        return .get
    }

    var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        request.allHTTPHeaderFields = headers
        return request
    }
}

enum RequestMethod {
    case post, patch, get, put
    var value: String {
        switch self {
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .get:
            return "GET"
        case .put:
            return "PUT"
        }
    }
}
