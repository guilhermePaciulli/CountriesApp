import Combine
import Foundation

class CountryListViewModel: ObservableObject {
    @Published var state: State
    weak var coordinator: CountryListCoordinatorProtocol?
    weak var client: CountriesClientProtocol?
    var subscriptions: Set<AnyCancellable> = []

    init(client: CountriesClientProtocol?, state: State = .loading) {
        self.state = state
        self.client = client
    }

    deinit {
        subscriptions = []
    }

    func onAppear() {
        state = .loading
        client?.fetchAllCountries()
            .map({ State.list(data: $0) })
            .replaceError({.error(
                title: "Ops...",
                message: $0.message
            )})
            .receive(on: RunLoop.main)
            .assign(to: \.state, on: self)
            .store(in: &subscriptions)
    }

    func didTapAt(country: Country) {
        coordinator?.goToCountryDetail(selectedCountry: country)
    }

    enum State {
        case loading
        case error(title: String, message: String)
        case list(data: [Country])
    }
}
