//
//  InterfaceBuilderFile.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 2017/12/13.
//

import Foundation

public protocol InterfaceBuilderFile {
    associatedtype Document = InterfaceBuilderDocument
    var pathString: String { get }
    var fileName: String { get }
    var ibType: IBType { get }

    var document: Document { get }

    init(path: String) throws
    init(url: URL) throws
    init(xml: String) throws
}

extension InterfaceBuilderFile {
    public var fileName: String {
        return pathString.components(separatedBy: "/").last!
    }
}

public enum IBType: String {
    case storyboard
    case xib
}
