//
//  NSObject+addRuntimeProperty.h
//  RuntimeProperty
//
//  Created by Erroll on 25.11.12.
//  Copyright 2012 Erroll Kappes. All rights reserved.
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing this disclaimer.
//
//  As a side note on using this code, you might consider giving some credit to me by
//	1) crediting me inside the app's credits page
//	2) or a tweet mentioning @errollslist
//	3) A paypal donation to kappes.erroll@gmail.com
//
//  A note on redistribution
//	While I'm ok with modifications to this source code,
//	if you are re-publishing after editing, please retain the above copyright notices


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
