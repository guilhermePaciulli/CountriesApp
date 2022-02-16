import SwiftUI

extension Color {
    init(_ rgbValue: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0)
        )
    }

    static var ctyGunMetal: Color {
        .init(0x22333B)
    }

    static var ctyRawSienna: Color {
        .init(0xC08552)
    }

    static var ctyLightGrey: Color {
        .init(0xCDD3D5)
    }

    static var ctyMiddleBlueGreen: Color {
        .init(0x77CBB9)
    }
    
    static var ctyDarkSkyBlue: Color {
        .init(0x75B8C8)
    }
}
