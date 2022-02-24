import UIKit

class AppDependencyInjector {
    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        controller.navigationBar.prefersLargeTitles = true
        return controller
    }()

    lazy var countryListCoordinator: CountryListCoordinator = {
        return CountryListCoordinator(navigationController: navigationController)
    }()
}
