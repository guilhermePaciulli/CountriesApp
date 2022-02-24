import SwiftUI

extension PreviewProvider {
    static func mockedObject<T: Decodable>(fileName: String) -> T {
        let path = Bundle(for: AppDelegate.self).path(forResource: fileName, ofType: "json")
        assert(
            path != nil,
            """
            Path for file \(fileName).json not found, please verify initialization parameters.
            """
        )
        let unwrappedPath = path!
        let data = try? Data(contentsOf: URL(fileURLWithPath: unwrappedPath), options: .mappedIfSafe)
        assert(
            data != nil,
            """
            Data of file \(fileName).json couldn't be read, please verify if file isn't corrupted.
            """
        )
        let unwrappedData = data!
        let object = try? JSONDecoder().decode(T.self, from: unwrappedData)
        assert(
            object != nil,
            """
            Given decodable object \(String(describing: T.self)) isn't comply to data on \(fileName).json
            """
        )
        return object!
    }
}
