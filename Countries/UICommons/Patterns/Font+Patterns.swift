import SwiftUI

extension Font {
    static var ctyTitle: Font {
        .system(
            size: 36,
            weight: .semibold,
            design: .rounded
        )
    }

    static var ctyHeadline: Font {
        .system(
            size: 18,
            weight: .bold,
            design: .rounded
        )
    }

    static var ctyText: Font {
        .system(
            size: 16,
            weight: .light,
            design: .rounded
        )
    }
}
