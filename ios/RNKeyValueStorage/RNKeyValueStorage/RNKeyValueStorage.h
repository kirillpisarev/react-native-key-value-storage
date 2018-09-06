//
//  RNKeyValueStorage.h
//  RNKeyValueStorage
//
//  Created by Кирилл Писарев on 06.09.2018.
//  Copyright © 2018 Kirill Pisarev. All rights reserved.
//
#import <React/RCTBridgeModule.h>

@interface KeyValueStorage : NSObject <RCTBridgeModule>
    
+ (NSString*)getForKey:(NSString*)key;
+ (BOOL)setForKey:(NSString*)key andValue:(NSString*)value;
+ (BOOL)removeForKey:(NSString*)key;
    
@end
