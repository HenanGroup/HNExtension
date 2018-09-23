//
//  Array+Extension.swift
//  HNExtension
//
//  Created by 郭伟坤 on 2018/9/22.
//

import Foundation

extension Array where Array.Iterator.Element: Hashable {

    /// 合并两个数组，返回合并后的数组
    ///
    /// - Parameters:
    ///   - other: 被合并的数组
    ///   - combine: 冲突时Closure，(currentElement, newElement) -> changeElement
    /// - Returns: 合并后的数组
    @discardableResult
    public func hn_merge(_ other: [Element], uniquingKeysWith combine: (Element, Element) -> Element) -> Array {
        let selfSet = Set<Element>(self)
        var selfArray = self
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
}

extension Array {
    
    /// 删除数组中重复的元素
    ///
    /// - Parameter filter: 去重方式Closure
    /// - Returns: 返回已去重的数组
    @discardableResult
    public func hn_filterRepeat<E: Hashable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        var keySet: Set<E> = []
        for value in self {
            let key = filter(value)
            if !keySet.contains(key) {
                keySet.insert(key)
                result.append(value)
            }
        }
        return result
    }
}
