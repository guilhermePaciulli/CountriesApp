import UIKit

protocol CountryListCoordinatorProtocol: AnyObject {
    func goToCountryDetail(selectedCountry: Country)
}

class CountryListCoordinator: CountryListCoordinatorProtocol {
    let injector = CountryDependencyInjector()
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        injector.viewModel.coordinator = self
        navigationController.setViewControllers([injector.listView], animated: true)
    }

    func goToCountryDetail(selectedCountry: Country) {
        
    }
}
