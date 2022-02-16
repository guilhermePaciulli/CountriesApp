import Foundation

struct Country: Codable, Identifiable {
    var id = UUID()
    let name: CountryName
    let olympicCommitteeCode: String?
    let isIndependent: Bool?
    let isUnMember: Bool
    let currencies: [String: CountryCurrencyInfo]?
    let dialingInfo: CountryDialingInfo
    let capital: [String]?
    let alternativeSpellings: [String]
    let region: CountryRegion
    let subregion: String?
    let languages: [String: String]?
    let latitudeLongitude: [Double]
    let borders: [String]?
    let area: Double
    let residentsNames: [String: [String: String]]?
    let emojiFlag: String?
    let mapLinks: CountryMapsLinks
    let population: Int
    let drivingSide: CountryCarInformation
    let timezones: [String]
    let continents: [CountryContinent]
    let flags: CountryFlagImages
    let coatOfArms: CountryFlagImages
    let startOfWeek: CountryWeekDay
    let capitalLocation: CountryCapitalLocation
    let postalCode: CountrPostalCode?
    
    enum CodingKeys: String, CodingKey {
        case name
        case olympicCommitteeCode = "cioc"
        case isIndependent = "independent"
        case isUnMember = "unMember"
        case currencies
        case dialingInfo = "idd"
        case capital
        case alternativeSpellings = "altSpellings"
        case region
        case subregion
        case languages
        case latitudeLongitude = "latlng"
        case borders
        case area
        case residentsNames = "demonyms"
        case emojiFlag = "flag"
        case mapLinks = "maps"
        case population
        case drivingSide = "car"
        case timezones
        case continents
        case flags
        case coatOfArms
        case startOfWeek
        case capitalLocation = "capitalInfo"
        case postalCode
    }
}

struct CountryName: Codable {
    let common: String
    let official: String
    let native: [String: String]?
}

struct CountryCurrencyInfo: Codable {
    let name: String
    let symbol: String?
}

struct CountryDialingInfo: Codable {
    let root: String?
    let suffixes: [String]?
}

enum CountryRegion: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum CountryContinent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

struct CountryMapsLinks: Codable {
    let googleMaps, openStreetMaps: String
}

struct CountryCarInformation: Codable {
    let side: Side
    enum Side: String, Codable {
        case sideLeft = "left"
        case sideRight = "right"
    }
}

struct CountryFlagImages: Codable {
    let png: String?
    let svg: String?
}

enum CountryWeekDay: String, Codable {
    case monday, sunday, turday
}

struct CountryCapitalLocation: Codable {
    let latlng: [Double]?
}

struct CountrPostalCode: Codable {
    let format: String
    let regex: String?
}
