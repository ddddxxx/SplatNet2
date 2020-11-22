import Foundation

public typealias Date = Foundation.Date
public typealias URL = Foundation.URL

public enum SN2Host: RemoteResourceHost {
    public static let host = URL(string: "https://app.splatoon2.nintendo.net")!
}

public typealias SN2RemoteResource = RemoteResource<SN2Host>
