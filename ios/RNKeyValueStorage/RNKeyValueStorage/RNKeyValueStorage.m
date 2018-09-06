//
//  RNKeyValueStorage.m
//  RNKeyValueStorage
//
//  Created by Кирилл Писарев on 06.09.2018.
//  Copyright © 2018 Kirill Pisarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNKeyValueStorage.h"

@implementation KeyValueStorage
    
RCT_EXPORT_MODULE();

+ (NSString*)getForKey:(NSString*)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}
    
+ (BOOL)setForKey:(NSString*)key andValue:(NSString*)value {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}
    
+ (BOOL)removeForKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

RCT_EXPORT_METHOD(get:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([[self class] getForKey:key]);
}
    
RCT_EXPORT_METHOD(set:(NSString*)key
                  value:(NSString*)value
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL isSaved = [[self class] setForKey:key andValue:value];
    if(isSaved) {
        resolve(nil);
    } else {
        NSError *error = [NSError errorWithDomain:@"set_error" code:200 userInfo:nil];
        reject(@"set_error", @"Some error occurred when tried to save data", error);
    }
}

RCT_EXPORT_METHOD(remove:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL isSaved = [[self class] removeForKey:key];
    if(isSaved) {
        resolve(nil);
    } else {
        NSError *error = [NSError errorWithDomain:@"set_error" code:200 userInfo:nil];
        reject(@"remove_error", @"Some error occurred when tried to remove data", error);
    }
}

@end
