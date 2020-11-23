import Foundation

// MARK: - SN2WebResource

public typealias SN2URL = Foundation.URL
public typealias SN2WebResource = IndirectValue<IndirectAccessors.SN2Host>

extension IndirectAccessors {
    
    public enum SN2Host: IndirectAccessor {
        
        public static let host = SN2URL(string: "https://app.splatoon2.nintendo.net")!
        
        public static func access(_ path: String) -> SN2URL {
            host.appendingPathComponent(path)
        }
    }
}

// MARK: - Timestamp

public typealias SN2Date = Foundation.Date
public typealias Timestamp = IndirectValue<IndirectAccessors.TimestampToDate>

extension IndirectAccessors {

    public enum TimestampToDate: IndirectAccessor {
        
        public static func access(_ timestamp: TimeInterval) -> SN2Date {
            return SN2Date(timeIntervalSince1970: timestamp)
        }
    }
}
