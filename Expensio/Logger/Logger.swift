//
//  Logger.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation

enum Log {
    private
    enum LogLevel {
        case info, warning, error
        fileprivate var prefix: String {
            switch self {
            case .info:    return "INFO 🔹"
            case .warning: return "WARN ⚠️"
            case .error:   return "ALERT ❌"
            }
        }
    }
    
    private
    struct Context {
        let file: String
        let function: String
        let line: UInt
        var description: String {
            "\((file as NSString).lastPathComponent) : \(line) \(function)"
        }
        
    }
    
    static func info(_ str: StaticString,
                     shouldLogContext: Bool = true,
                     file: String = #file,
                     function: String = #function,
                     line: UInt = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info,
                      str: str.description,
                      error: nil,
                      shouldLogContext: shouldLogContext,
                      context: context)
    }
    
    static func warning(_
                        str: StaticString,
                        error: Error? = nil,
                        file: String = #file,
                        function: String = #function,
                        line: UInt = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .warning,
                      str: str.description,
                      error: error,
                      shouldLogContext: true,
                      context: context)
    }
    
    static func error(_
                      str: StaticString,
                      error: Error? = nil,
                      file: String = #file,
                      function: String =  #function,
                      line: UInt = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error,
                      str: str.description,
                      error: error,
                      shouldLogContext: true,
                      context: context)
    }
    
    private static func handleLog(level: LogLevel,
                                  str: String,
                                  error: Error?,
                                  shouldLogContext: Bool,
                                  context: Context) {
        let logComponents = ["[\(level.prefix)]", str]
        var fullString = logComponents.joined(separator: " ")
        if shouldLogContext {
            fullString += " @ [\(context.description)]"
        }
        if let error {
            fullString = "\(fullString): \(error.localizedDescription)"
        }
        print(fullString)
    }
    
}
