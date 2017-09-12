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
    
    let value = get(key as! String)
    resolve(value)
  }
  
  func get(_ key: String) -> Any? {
    return UserDefaults.standard.object(forKey: key)
  }
  
  @objc func set(_ key: Any?, withValue value: Any, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    guard key != nil, key is String else {
      let errorMsg = "Key should be a string"
      let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
      reject("IncorrectKey", errorMsg, err)
      return
    }
    
    set(key as! String, withValue: value)
    resolve(true)
  }
  
  func set(_ key: String, withValue value: Any) -> Void {
    return UserDefaults.standard.set(value, forKey: key)
  }
  
  @objc func remove(_ key: Any?, resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    guard key != nil, key is String else {
      let errorMsg = "Key should be a string"
      let err: NSError = NSError(domain: errorMsg, code: 0, userInfo: nil)
      reject("IncorrectKey", errorMsg, err)
      return
    }
    
    remove(key as! String)
    resolve(true)
  }
  
  func remove(_ key: String) -> Void {
    return UserDefaults.standard.removeObject(forKey: key)
  }
  
}
