struct APIError: Codable, Error {
    let message: String
}

extension APIError {
    static let timeout = APIError(
        message: "Check your internet connection"
    )
    static let generic = APIError(
        message: "There was an internal error"
    )
    static let jsonConversionFailure = APIError(
        message: "There was an internal error"
    )
}
