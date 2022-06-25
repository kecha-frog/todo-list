import Foundation

public protocol ParserProtocol {
    var decoder: JSONDecoder { get }
    var nextHandler: ParserProtocol? { get set }

    func parseData(_ data: Data) -> [PersonModel]
}

public class ResultParser: ParserProtocol {
    public let decoder = JSONDecoder()

    public var nextHandler: ParserProtocol?

    public init(){}

    public func parseData(_ data: Data) -> [PersonModel] {
        guard let result = try? decoder.decode(ResultModel.self, from: data) else {
            return nextHandler?.parseData(data) ?? []
        }

        return result.result
    }
}

public class DataParser: ParserProtocol {
    public let decoder = JSONDecoder()

    public var nextHandler: ParserProtocol?

    public init(){}

    public func parseData(_ data: Data) -> [PersonModel] {
        guard let result = try? decoder.decode(DataModel.self, from: data) else {
            return nextHandler?.parseData(data) ?? []
        }

        return result.data
    }
}

public class ArrayParser: ParserProtocol {
    public let decoder = JSONDecoder()

    public var nextHandler: ParserProtocol?

    public init(){}

    public func parseData(_ data: Data) -> [PersonModel] {
        guard let result = try? decoder.decode([PersonModel].self, from: data) else {
            return nextHandler?.parseData(data) ?? []
        }

        return result
    }
}
