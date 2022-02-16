enum CountriesEndpoints: Endpoint {
    case indexAll

    var path: String {
        switch self {
        case .indexAll:
            return "/all"
        }
    }
}
