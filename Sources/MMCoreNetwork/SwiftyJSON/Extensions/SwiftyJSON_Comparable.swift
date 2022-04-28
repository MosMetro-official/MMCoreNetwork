//
//  SwiftyJSON_Comparable.swift
//  
//
//  Created by polykuzin on 15/02/2022.
//

import Foundation

extension JSON: Swift.Comparable { }

public func == (lhs: JSON, rhs: JSON) -> Bool {
    
    switch (lhs.type, rhs.type) {
    case (.number, .number):
        return lhs.rawNumber == rhs.rawNumber
        
    case (.string, .string):
        return lhs.rawString == rhs.rawString
        
    case (.bool, .bool):
        return lhs.rawBool == rhs.rawBool
        
    case (.array, .array):
        return lhs.rawArray as NSArray == rhs.rawArray as NSArray
        
    case (.dictionary, .dictionary):
        return lhs.rawDictionary as NSDictionary == rhs.rawDictionary as NSDictionary
        
    case (.null, .null):
        return true
        
    default:
        return false
    }
}

public func <= (lhs: JSON, rhs: JSON) -> Bool {
    
    switch (lhs.type, rhs.type) {
    case (.number, .number):
        return lhs.rawNumber <= rhs.rawNumber
        
    case (.string, .string):
        return lhs.rawString <= rhs.rawString
        
    case (.bool, .bool):
        return lhs.rawBool == rhs.rawBool
        
    case (.array, .array):
        return lhs.rawArray as NSArray == rhs.rawArray as NSArray
        
    case (.dictionary, .dictionary):
        return lhs.rawDictionary as NSDictionary == rhs.rawDictionary as NSDictionary
        
    case (.null, .null):
        return true
        
    default:
        return false
    }
}

public func >= (lhs: JSON, rhs: JSON) -> Bool {
    
    switch (lhs.type, rhs.type) {
    case (.number, .number):
        return lhs.rawNumber >= rhs.rawNumber
        
    case (.string, .string):
        return lhs.rawString >= rhs.rawString
        
    case (.bool, .bool):
        return lhs.rawBool == rhs.rawBool
        
    case (.array, .array):
        return lhs.rawArray as NSArray == rhs.rawArray as NSArray
        
    case (.dictionary, .dictionary):
        return lhs.rawDictionary as NSDictionary == rhs.rawDictionary as NSDictionary
        
    case (.null, .null):
        return true
        
    default:
        return false
    }
}

public func > (lhs: JSON, rhs: JSON) -> Bool {
    
    switch (lhs.type, rhs.type) {
    case (.number, .number):
        return lhs.rawNumber > rhs.rawNumber
        
    case (.string, .string):
        return lhs.rawString > rhs.rawString
        
    default:
        return false
    }
}

public func < (lhs: JSON, rhs: JSON) -> Bool {
    
    switch (lhs.type, rhs.type) {
    case (.number, .number):
        return lhs.rawNumber < rhs.rawNumber
        
    case (.string, .string):
        return lhs.rawString < rhs.rawString
        
    default:
        return false
    }
}

private let trueNumber = NSNumber(value: true)
private let falseNumber = NSNumber(value: false)
private let trueObjCType = String(cString: trueNumber.objCType)
private let falseObjCType = String(cString: falseNumber.objCType)

// MARK: - NSNumber: Comparable

extension NSNumber {
    
    var isBool: Bool {
        let objCType = String(cString: self.objCType)
        if (self.compare(trueNumber) == .orderedSame && objCType == trueObjCType) || (self.compare(falseNumber) == .orderedSame && objCType == falseObjCType) {
            return true
        } else {
            return false
        }
    }
}

func == (lhs: NSNumber, rhs: NSNumber) -> Bool {
    switch (lhs.isBool, rhs.isBool) {
    case (false, true):
        return false
        
    case (true, false):
        return false
        
    default:
        return lhs.compare(rhs) == .orderedSame
    }
}

func != (lhs: NSNumber, rhs: NSNumber) -> Bool {
    return !(lhs == rhs)
}

func < (lhs: NSNumber, rhs: NSNumber) -> Bool {
    
    switch (lhs.isBool, rhs.isBool) {
    case (false, true):
        return false
        
    case (true, false):
        return false
        
    default:
        return lhs.compare(rhs) == .orderedAscending
    }
}

func > (lhs: NSNumber, rhs: NSNumber) -> Bool {
    
    switch (lhs.isBool, rhs.isBool) {
    case (false, true):
        return false
        
    case (true, false):
        return false
        
    default:
        return lhs.compare(rhs) == ComparisonResult.orderedDescending
    }
}

func <= (lhs: NSNumber, rhs: NSNumber) -> Bool {
    
    switch (lhs.isBool, rhs.isBool) {
    case (false, true):
        return false
        
    case (true, false):
        return false
        
    default:
        return lhs.compare(rhs) != .orderedDescending
    }
}

func >= (lhs: NSNumber, rhs: NSNumber) -> Bool {
    
    switch (lhs.isBool, rhs.isBool) {
    case (false, true):
        return false
        
    case (true, false):
        return false
        
    default:
        return lhs.compare(rhs) != .orderedAscending
    }
}

public enum writingOptionsKeys {
    case jsonSerialization
    case castNilToNSNull
    case maxObjextDepth
    case encoding
}
