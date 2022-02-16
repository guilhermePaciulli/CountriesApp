import SwiftUI

class CountryDependencyInjector {
    lazy var client: CountriesClientProtocol = {
        return CountriesClient()
    }()
    lazy var viewModel: CountryListViewModel = {
        return CountryListViewModel(
            client: client
        )
    }()
    lazy var listView: UIViewController = {
        return UIHostingController(
            rootView: CountryListView(
                viewModel: viewModel
            )
        )
    }()
}
