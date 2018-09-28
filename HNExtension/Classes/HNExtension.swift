//
//  HNExtension.swift
//  HNExtension
//
//  Created by 郭伟坤 on 2018/9/22.
//  Copyright © 2018年 HenanGroup. All rights reserved.
//

public struct HenanExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol HenanExtensionCompatible {
    associatedtype CompatibleType
    
    static var hn: HenanExtension<CompatibleType>.Type { get set }
    
    var hn: HenanExtension<CompatibleType> { get set }
}

extension HenanExtensionCompatible {
    /// Reactive extensions.
    public static var hn: HenanExtension<Self>.Type {
        get {
            return HenanExtension<Self>.self
        }
        set {}
    }
    
    /// Reactive extensions.
    public var hn: HenanExtension<Self> {
        get {
            return HenanExtension(self)
        }
        set {}
    }
}
