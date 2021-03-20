//
//  PMLogger.swift
//  Powdermills
//
//  Created by James Sadlier on 20/03/2021.
//

import Foundation
import os.log

public class PMLogger {
	private static var subsystem = Bundle.main.bundleIdentifier ?? "PowdermilsApp"
	
	/// The logger singleton instance
	public static var sharedInstance = PMLogger()
	
	//MARK: App logs
	/// Default category logging
	public let defaultLog = Logger(subsystem: subsystem, category: "default")
	/// Database category logging
	public let databaseLog = Logger(subsystem: subsystem, category: "database")
	/// Map category logging
	public let mapLog = Logger(subsystem: subsystem, category: "maps")
	
	/// Log the string to the os logger
	/// - Parameters:
	///   - string: Message to log
	///   - logger: Which logger to use, defaults to defaultLog
	///   - file: the file name, leave as default to use file called from
	///   - function: the function name, leave as default to use file called from
	///   - line: the line number, leave as default to use file called from
	public func log(string: String, logger: Logger = PMLogger.sharedInstance.defaultLog, file: String = #file, function: String = #function, line: Int = #line) {
		let fileName = file.components(separatedBy: "/").last ?? ""
		let fullString = "\(fileName).\(function) \(Date()) [Line:\(line)] - \(string)"
		logger.log("\(fullString, privacy: .public)")
	}
}
