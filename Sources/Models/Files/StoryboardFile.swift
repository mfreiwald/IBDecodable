//
//  StoryboardFile.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 2017/12/11.
//

import SWXMLHash
import Foundation

public class StoryboardFile: InterfaceBuilderFile {

    public var pathString: String

    public let ibType: IBType = .storyboard
    public let document: StoryboardDocument

    required public init(path: String) throws {
        self.pathString = path
        self.document = try type(of: self).parseContent(pathString: path)
    }

    required public init(url: URL) throws {
        self.pathString = url.absoluteString
        self.document = try type(of: self).parseContent(url: url)
    }

    required public init(xml: String) throws {
        self.pathString = "$temporary.storyboard"
        self.document = try type(of: self).parseContent(xml: xml)
    }

    private static func parseContent(pathString: String) throws -> StoryboardDocument {
        let content = try String(contentsOfFile: pathString)
        return try parseContent(xml: content)
    }

    private static func parseContent(url: URL) throws -> StoryboardDocument {
        let parser = InterfaceBuilderParser()
        let content = try Data(contentsOf: url)
        return try parser.parseDocument(data: content)
    }

    private static func parseContent(xml: String) throws -> StoryboardDocument {
        let parser = InterfaceBuilderParser()
        return try parser.parseDocument(xml: xml)
    }

}
