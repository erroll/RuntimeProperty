//
//  NSObject+addRuntimeProperty.m
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

#import "NSObject+addRuntimeProperty.h"

@implementation NSObject (addRuntimeProperty)

- (void)setProperty:(id)property forKey:(char const * const)key withPolicy:(AssociantionPolicy)policy {
    
    // validate input
    NSAssert(property,@"PROPERTY must not be nil.");
    NSAssert(key,@"KEY must not be nil.");
    NSAssert(policy!=0, @"POLICY must not be null.");
    NSAssert([self isValidPolicy:policy],@"POLICY must be valid.");
    
    // associate object
    objc_setAssociatedObject(self, key, property, policy);
}

- (id)getPropertyForKey:(char const * const)key
{
    // validate input
    NSAssert(key,@"KEY must not be nil.");
    NSAssert(objc_getAssociatedObject(self, key)!=nil,@"there is no object for the given KEY.");
    
    // return object
    return objc_getAssociatedObject(self, key);
}

- (BOOL)hasPropertyForKey:(char const * const)key
{
    // validate input
    NSAssert(key,@"KEY must not be nil.");
    
    // return logical result
    return objc_getAssociatedObject(self, key) ? YES : NO;
}

/**
 checks if a given policy is valid
 
 @param policy - the memory management policy
 @return logical result indicating if policy is valid
 */

- (BOOL)isValidPolicy:(AssociantionPolicy)policy
{
    switch ( policy ) {
        case ASSIGN_POLICY:
        case RETAIN_NONATOMIC_POLICY:
        case COPY_NONATOMIC_POLICY:
        case RETAIN_POLICY:
        case COPY_POLICY:
            return YES;
        default:
            return NO;
    }
}

@end

