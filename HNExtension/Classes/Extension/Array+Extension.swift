//
//  Array+Extension.swift
//  HNExtension
//
//  Created by 郭伟坤 on 2018/9/22.
//

import Foundation

extension Array: HenanExtensionCompatible {}

public extension HenanExtension where Base: Sequence {
    /// 删除数组中重复的元素
    ///
    /// - Parameter filter: 去重方式Closure
    /// - Returns: 返回已去重的数组
    @discardableResult
    public func removeDuplicate<E: Hashable>(_ filter: (Base.Element) -> E) -> [Base.Element] {
        var result = [Base.Element]()
        var keySet: Set<E> = []
        for value in self.base {
            let key = filter(value)
            if !keySet.contains(key) {
                keySet.insert(key)
                result.append(value)
            }
        }
        return result
    }
}

public extension HenanExtension where Base: Sequence, Base.Element: Hashable {
    
    /// 合并两个集合，返回合并后的集合
    ///
    /// - Parameters:
    ///   - other: 被合并的集合
    ///   - combine: 接受任何重复Element的当前值和新值。闭包返回最终的期望值。
    /// - Returns: 合并后的集合
    @discardableResult
    public func merge(_ other: [Base.Element], uniquingWith combine: (Base.Element, Base.Element) -> Base.Element) -> [Base.Element] {
        let selfSet = Set(self.base)
        var selfArray: [Base.Element] = Array(self.base)
        other.forEach { (newElement) in
            if selfSet.contains(newElement) {
                guard let currentElement = (selfSet.filter { $0 == newElement }).first, let idx = selfArray.firstIndex(of: currentElement) else { return }
                let changeElement = combine(currentElement, newElement)
                selfArray.replaceSubrange(idx...idx, with: [changeElement])
            }
            else {
                selfArray.append(newElement)
            }
        }
        return selfArray
    }
    
    
    /// 判断集合是否是其它集合的子集
    ///
    /// - Parameter other: 其它集合
    /// - Returns: true 是other的子集，false 不是other的子集
    public func isSubset(of other: [Base.Element]) -> Bool {
        let selfSet = Set(self.base)
        let otherSet = Set(other)
        return selfSet.isSubset(of: otherSet)
    }
}
