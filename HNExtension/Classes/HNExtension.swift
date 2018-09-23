//
//  HNExtension.swift
//  HNExtension
//
//  Created by 郭伟坤 on 2018/9/22.
//  Copyright © 2018年 HenanGroup. All rights reserved.
//

public struct HenanExtension<Base> {
    /// Base object to extend.
    public let base: Base
    
    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol HenanExtensionCompatible {
    /// Extended type
    associatedtype CompatibleType
    
    /// Reactive extensions.
    static var hn: HenanExtension<CompatibleType>.Type { get }
    
    /// Reactive extensions.
    var hn: HenanExtension<CompatibleType> { get }
}

extension HenanExtensionCompatible {
    /// Reactive extensions.
    public static var hn: HenanExtension<Self>.Type {
        get {
            return HenanExtension<Self>.self
        }
    }
    
    /// Reactive extensions.
    public var hn: HenanExtension<Self> {
        get {
            return HenanExtension(self)
        }
    }
}

extension Array: HenanExtensionCompatible {
    
}
