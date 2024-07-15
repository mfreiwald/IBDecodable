//
//  XibFile.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 2017/12/13.
//

import SWXMLHash
import Foundation

public class XibFile: InterfaceBuilderFile {

    public var pathString: String

    public let ibType: IBType = .xib
    public let document: XibDocument

    required public init(path: String) throws {
        self.pathString = path
        self.document = try type(of: self).parseContent(pathString: path)
    }

    required public init(url: URL) throws {
        self.pathString = url.absoluteString
        self.document = try type(of: self).parseContent(url: url)
    }

    required public init(xml: String) throws {
        self.pathString = "$temporary.xib"
        self.document = try type(of: self).parseContent(xml: xml)
    }

    private static func parseContent(pathString: String) throws -> XibDocument {
        let content = try String(contentsOfFile: pathString)
        return try parseContent(xml: content)
    }

    private static func parseContent(url: URL) throws -> XibDocument {
        let parser = InterfaceBuilderParser()
        let content = try Data(contentsOf: url)
        return try parser.parseDocument(data: content)
    }

    private static func parseContent(xml: String) throws -> XibDocument {
        let parser = InterfaceBuilderParser()
        return try parser.parseDocument(xml: xml)
    }

}
