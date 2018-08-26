//
//  Log.swift
//  Share
//
//  Created by Andrew Wells on 10/30/17.
//  Copyright © 2017 Andrew Wells. All rights reserved.
//

import Foundation

private enum LogLevel: String {
    case verbose = "V"
    case debug = "D"
    case info = "I"
    case warn = "W"
    case error = "E"
}

public class Log: NSObject {

    public class func v(_ message: String, file: String=#file, function: String=#function, line: Int=#line) {
        Log.println(level: LogLevel.verbose, message: message, file: file, function: function, line: line)
    }

    public class func d(_ message: String, file: String=#file, function: String=#function, line: Int=#line) {
        Log.println(level: LogLevel.debug, message: message, file: file, function: function, line: line)
    }

    public class func i(_ message: String, file: String=#file, function: String=#function, line: Int=#line) {
        Log.println(level: LogLevel.info, message: message, file: file, function: function, line: line)
    }

    public class func w(_ message: String, file: String=#file, function: String=#function, line: Int=#line) {
        Log.println(level: LogLevel.warn, message: message, file: file, function: function, line: line)
    }

    public class func e(_ message: String, file: String=#file, function: String=#function, line: Int=#line) {
        Log.println(level: LogLevel.error, message: message, file: file, function: function, line: line)
    }

    private class func println(level: LogLevel, message: String, file: String, function: String, line: Int) {
        #if DEBUG
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        let strdate = fmt.string(from: Date())
        let logStr = "[\(strdate)][\(level.rawValue)][\((file as NSString).lastPathComponent)(L.\(line)) \(function)]: \(message)"
        Swift.print(logStr)
        #endif
    }

}
