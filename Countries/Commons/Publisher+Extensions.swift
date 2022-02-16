import Combine

extension Publisher {
    /// Casts all errors that are not from type `T` to a default one.
    /// - Parameters:
    ///   - defaultError: Error to be returned if received error is not of type `T`.
    ///   - T: Expected error type (should be of type `Error`).
    /// - Returns: A publisher with a specific error type `T`.
    func castUnknownErrorsAs<T: Error>(defaultError: T) -> AnyPublisher<Self.Output, T> {
        mapError { error in
            guard let threatableError = error as? T else { return defaultError }
            return threatableError
        }.eraseToAnyPublisher()
    }

    /// Transforms a `Publisher<Output, Failure>` to `Publisher<Output, Never>`, with a closure
    /// that receives a `Self.Failure` - which is the received error - and expects a `Output`.
    /// - Parameters:
    ///   - handler: closure that is run when a error is received on the data stream and transforms
    ///   the error into a `Output` type.
    /// - Returns: A `AnyPublisher` with no Error.
    func replaceError<P>(
        _ handler: @escaping (Self.Failure) -> P
    ) -> AnyPublisher<Self.Output, Never> where Self.Output == P {
        self.catch {
            Just(handler($0))
        }.eraseToAnyPublisher()
    }
}

