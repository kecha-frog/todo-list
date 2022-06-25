import Foundation

public class Parser {
    private let dataParser = DataParser()
    private let resultParser = ResultParser()
    private let arrayParser = ArrayParser()

    public init() {
        dataParser.nextHandler = resultParser
        resultParser.nextHandler = arrayParser
    }

    public func parse(_ name: String) -> [PersonModel] {
        let data = data(from: name)
        return dataParser.parseData(data)
    }

    private func data(from file: String) -> Data {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            fatalError("FILE ERROR")
        }
    }
}
