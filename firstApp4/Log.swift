//
// Created by Александр Студенецкий on 12.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class Log : ILogInteractor {
    static let logFile = "log.txt"
    static let fileManager = FileManager()
    static let tempDir = NSTemporaryDirectory()

    static func d(moduleName: String, message: String) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none

        let textToPrint = formatter.string(from: currentDateTime) + " : " + moduleName + " - " + message
        print(textToPrint)
        appendTextToFile(text: textToPrint)
    }

    private static func appendTextToFile(text: String) {
        let path = (tempDir as NSString).appendingPathComponent(logFile)
        let contentsToWrite = "\(text)\n"
        let fileURL = URL(fileURLWithPath: path)

        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            fileHandle.seekToEndOfFile()
            fileHandle.write(contentsToWrite.data(using: .utf8)!)
            fileHandle.closeFile()
        } catch {
            print("Error writing to file \(error)")
        }
    }

    func clearLog() {
        let path = (Log.tempDir as NSString).appendingPathComponent(Log.logFile)
        let fileURL = URL(fileURLWithPath: path)
        do {
            try "".write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
    }

    func getLog() -> String {
        let path = (NSTemporaryDirectory() as NSString).appendingPathComponent(Log.logFile)

        do {
            let contentsOfFile = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            return contentsOfFile as String
        } catch let error as NSError {
            print("there is an file reading error: \(error)")
        }
        return ""
    }

}