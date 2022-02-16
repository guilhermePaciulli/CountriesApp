import Combine

protocol CountriesClientProtocol: AnyObject {
    func fetchAllCountries() -> AnyPublisher<[Country], APIError>
}

class CountriesClient: APIClient, CountriesClientProtocol {
    
    func fetchAllCountries() -> AnyPublisher<[Country], APIError> {
        dispatch(request: CountriesEndpoints.indexAll.request)
    }
}
