//
//  StartAppsKitnewLogger.swift
//  Jeeves
//
//  Created by Gabriel Lanata on 16/10/16.
//
//

import Foundation

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
        public var emoji: String {
            switch self {
            case .none:    return "💚"
            case .fatal:   return "🔥"
            case .error:   return "‼️"
            case .warning: return "⚠️"
            case .info:    return "💬"
            case .debug:   return "⚙️"
            case .verbose: return "🔬"
            }
        }
    }
    
    public static var level: Level = .debug
    
    public static var indentation0:  Int = 3
    public static var indentation1:  Int = 50
    public static var indentation2:  Int = 150
    public static var separator:  String = ", "
    public static var terminator: String = "\n"
    
    fileprivate static func log(_ level: Level, itemArray: [Any], fileName: String = #file,
                           functionName: String = #function, lineNum: Int = #line) {
        guard level.rawValue <= self.level.rawValue else { return }
        var printString = "\(level.emoji)"
        printString = printString.addPaddingAfter(indentation0)
        printString += "\(fileName.components(separatedBy: "/").last!)~\(lineNum):"
        printString = printString.addPaddingAfter(indentation1)
        printString += itemArray.map({ String(describing: $0) }).joined(separator: separator)
        print(printString, terminator: terminator)
    }
    
    public static func log(_ level: Level, _ items: Any..., fileName: String = #file,
                           functionName: String = #function, lineNum: Int = #line) {
        log(level, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    
    public class func fatal(_ items: Any..., fileName: String = #file,
                            functionName: String = #function, lineNum: Int = #line) {
        log(.fatal, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func error(_ items: Any..., fileName: String = #file,
                            functionName: String = #function, lineNum: Int = #line) {
        log(.error, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func warning(_ items: Any..., fileName: String = #file,
                              functionName: String = #function, lineNum: Int = #line) {
        log(.warning, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func info(_ items: Any..., fileName: String = #file,
                           functionName: String = #function, lineNum: Int = #line) {
        log(.info, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public class func debug(_ items: Any..., fileName: String = #file,
                            functionName: String = #function, lineNum: Int = #line) {
        log(.debug, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
    public static func verbose(_ items: Any..., fileName: String = #file,
                               functionName: String = #function, lineNum: Int = #line) {
        log(.verbose, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
    }
    
}

fileprivate extension String {
    
    fileprivate func addPaddingAfter(_ length: Int) -> String {
        let paddingCount = max(length-self.characters.count, 0)
        let paddingString = String(repeating: " ", count: paddingCount)
        return self+paddingString
    }
    
}


// Legacy support
public func print(owner: String, items: Any..., level: Log.Level,
                  fileName: String = #file, functionName: String = #function, lineNum: Int = #line) {
    Log.log(level, itemArray: items, fileName: fileName, functionName: functionName, lineNum: lineNum)
}
