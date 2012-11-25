//
//  NSObject+addRuntimeProperty.h
//  AVL Powertrain World
//
//  Created by Erroll on 29.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/**
 The AssociantionPolicy enum determines the association memory management type.
 */

typedef enum {
    ASSIGN_POLICY = OBJC_ASSOCIATION_ASSIGN,
    RETAIN_NONATOMIC_POLICY = OBJC_ASSOCIATION_RETAIN_NONATOMIC,
    COPY_NONATOMIC_POLICY = OBJC_ASSOCIATION_COPY_NONATOMIC,
    RETAIN_POLICY = OBJC_ASSOCIATION_RETAIN,
    COPY_POLICY = OBJC_ASSOCIATION_COPY
}AssociantionPolicy;

@interface NSObject (addRuntimeProperty)

/**
 Sets the association between any property for a specific key.
 
 @param property - the associated object
 @param key - the key to identify the associated object
 @param policy - the memory management policy
 */
- (void)setProperty:(id)property forKey:(char const * const)key withPolicy:(AssociantionPolicy)policy;


/**
 returns the associated object for a given key.
 
 @param key - the key to identify the associated object
 @return the assiciated object
 */
- (id)getPropertyForKey:(char const * const)key;

/**
 determines if there is a object for a given key.
 
 @param key - the key to identify the associated object
 @return a boolean value indicating if there is a associated object for a given key
 */
- (BOOL)hasPropertyForKey:(char const * const)key;

@end
