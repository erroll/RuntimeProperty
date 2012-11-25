//
//  NSObject+addRuntimeProperty.h
//  AVL Powertrain World
//
//  Created by Erroll on 29.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef enum {
    ASSIGN_POLICY = OBJC_ASSOCIATION_ASSIGN,
    RETAIN_NONATOMIC_POLICY = OBJC_ASSOCIATION_RETAIN_NONATOMIC,
    COPY_NONATOMIC_POLICY = OBJC_ASSOCIATION_COPY_NONATOMIC,
    RETAIN_POLICY = OBJC_ASSOCIATION_RETAIN,
    COPY_POLICY = OBJC_ASSOCIATION_COPY
}AssociantionPolicy;

@interface NSObject (addRuntimeProperty)

- (void)setProperty:(id)property forKey:(char const * const)key withPolicy:(AssociantionPolicy)policy;

- (id)getPropertyForKey:(char const * const)key;

- (BOOL)hasPropertyForKey:(char const * const)key;

@end
