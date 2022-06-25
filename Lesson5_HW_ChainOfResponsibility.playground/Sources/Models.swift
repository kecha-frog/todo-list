import Foundation

public struct PersonModel: Codable {
    let name: String
    let age: Int
    let isDeveloper: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case age
        case isDeveloper
    }
}

public struct ResultModel: Codable {
    let result: [PersonModel]

    enum CodingKeys: String, CodingKey {
        case result
    }
}

public struct DataModel: Codable {
    let data: [PersonModel]

    enum CodingKeys: String, CodingKey {
        case data
    }
}
