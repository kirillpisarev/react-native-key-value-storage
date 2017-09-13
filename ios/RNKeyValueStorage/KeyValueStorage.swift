//
//  PushManager.swift
//  mobile_cabinet
//
//  Created by Кирилл Писарев on 11.09.17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import Foundation

@objc(KeyValueStorage)
class KeyValueStorage: NSObject {
  
  @objc func get(_ key: Any?, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    guard key != nil, key is String else {
      let errorMsg = "Key should be a string"
      let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
      reject("IncorrectKey", errorMsg, err)
      return
    }
    
    let value = KeyValueStorage.get(key as! String)
    resolve(value)
  }
  
  static func get(_ key: String) -> String? {
    return UserDefaults.standard.string(forKey: key)
  }
  
  @objc func set(_ key: Any?, withValue value: Any?, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    guard key != nil, key is String else {
      let errorMsg = "Key should be a string"
      let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
      reject("IncorrectKey", errorMsg, err)
      return
    }
    
    guard value is String else {
      let errorMsg = "Value should be a string"
      let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
      reject("IncorrectValue", errorMsg, err)
      return
    }
    
    KeyValueStorage.set(key as! String, withValue: value as! String)
    resolve(true)
  }
  
  static func set(_ key: String, withValue value: String?) -> Void {
    return UserDefaults.standard.set(value, forKey: key)
  }
  
  @objc func remove(_ key: Any?, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    guard key != nil, key is String else {
      let errorMsg = "Key should be a string"
      let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
      reject("IncorrectKey", errorMsg, err)
      return
    }
    
    KeyValueStorage.remove(key as! String)
    resolve(true)
  }
  
  static func remove(_ key: String) -> Void {
    return UserDefaults.standard.removeObject(forKey: key)
  }
  
}
