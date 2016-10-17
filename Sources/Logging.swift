//
//  StartAppsKitnewLogger.swift
//  Jeeves
//
//  Created by Gabriel Lanata on 16/10/16.
//
//

public class Log {
    
    public enum Level: Int, CustomStringConvertible {
        case none = 0, fatal, error, warning, info, debug, verbose
        public var description: String {
            switch self {
            case .none:    return "NONE"
            case .fatal:   return "FATAL"
            case .error:   return "ERROR"
            case .warning: return "WARNING"
            case .info:    return "INFO"
            case .debug:   return "DEBUG"
            case .verbose: return "VERBOSE"
            }
        }
    }
    
    public static var level: Level = .debug
    
    public static var indentation1:  Int = 25
    public static var indentation2:  Int = 100
    public static var separator:  String = ", "
    public static var terminator: String = "\n"
    
    public static func log(_ level: Level, _ items: Any..., fileName: String = #file,
                           functionName: String = #function, lineNum: Int = #line) {
        guard level.rawValue <= self.level.rawValue else { return }
        var printString = "\(fileName): "
        let indentation1Count = max(indentation1-printString.characters.count, 0)
        let indentation1String = String(repeating: " ", count: indentation1Count)
        var itemsString = String(describing: items[0])
        for i in 1..<items.count { itemsString += "\(separator)\(String(describing: items[i]))" }
        printString += "\(indentation1String)\(itemsString)"
        if level.rawValue <= Level.warning.rawValue {
            let indentation2Count = max(indentation2-printString.characters.count, 0)
            let indentation2String = String(repeating: " ", count: indentation2Count)
            printString += "\(indentation2String)\(level)"
        }
        print(printString, terminator: terminator)
    }
    
    
    public class func fatal(_ items: Any..., fileName: String = #file,
                            functionName: String = #function, lineNum: Int = #line) {
        log(.fatal, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func error(_ items: Any..., fileName: String = #file,
                            functionName: String = #function, lineNum: Int = #line) {
        log(.error, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func warning(_ items: Any..., fileName: String = #file,
                              functionName: String = #function, lineNum: Int = #line) {
        log(.warning, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func info(_ items: Any..., fileName: String = #file,
                           functionName: String = #function, lineNum: Int = #line) {
        log(.info, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func debug(_ items: Any..., fileName: String = #file,
                            functionName: String = #function, lineNum: Int = #line) {
        log(.debug, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public static func verbose(_ items: Any..., fileName: String = #file,
                               functionName: String = #function, lineNum: Int = #line) {
        log(.verbose, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
}


// Legacy support
public func print(owner: String, items: Any..., level: Log.Level,
                  fileName: String = #file, functionName: String = #function, lineNum: Int = #line) {
    Log.log(level, items, fileName: fileName, functionName: functionName, lineNum: lineNum)
}
