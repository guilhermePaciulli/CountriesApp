import UIKit

class AppDependencyInjector {
    lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()

    lazy var countryListCoordinator: CountryListCoordinator = {
        return CountryListCoordinator(navigationController: navigationController)
    }()
}
