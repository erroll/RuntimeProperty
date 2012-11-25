//
//  NSObject+addRuntimeProperty.m
//  AVL Powertrain World
//
//  Created by Erroll on 29.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSObject+addRuntimeProperty.h"

@implementation NSObject (addRuntimeProperty)

- (void)setProperty:(id)property forKey:(char const * const)key withPolicy:(AssociantionPolicy)policy {
    NSAssert(property,@"PROPERTY must not be nil.");
    NSAssert(key,@"KEY must not be nil.");
    NSAssert(policy!=0, @"POLICY must not be null.");
    NSAssert([self isValidPolicy:policy],@"POLICY must be valid.");
    objc_setAssociatedObject(self, key, property, policy);
}

- (id)getPropertyForKey:(char const * const)key
{
    NSAssert(key,@"KEY is not be nil.");
    NSAssert(objc_getAssociatedObject(self, key)!=nil,@"there is no object for the given KEY.");
    return objc_getAssociatedObject(self, key);
}

- (BOOL)hasPropertyForKey:(char const * const)key
{
    NSAssert(key,@"KEY must not be nil.");
    return objc_getAssociatedObject(self, key)?YES:NO;
}

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

