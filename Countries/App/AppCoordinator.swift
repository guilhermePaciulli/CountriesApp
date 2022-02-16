import UIKit

class AppCoordinator {
    let window: UIWindow
    let injector: AppDependencyInjector
    
    init(window: UIWindow) {
        injector = AppDependencyInjector()
        self.window = window
    }

    func start() {
        window.rootViewController = injector.navigationController
        injector.countryListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
