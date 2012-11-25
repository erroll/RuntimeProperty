//
//  RuntimePropertyTests.m
//  RuntimePropertyTests
//
//  Created by Erroll Kappes on 25.11.12.
//  Copyright (c) 2012 Erroll Kappes. All rights reserved.
//

#import "RuntimePropertyTests.h"
#import "NSObject+addRuntimeProperty.h"

@interface RuntimePropertyTests () {
    NSString *_helloString;
    NSString *_originString;

    NSDictionary *_dict;
}
@end

@implementation RuntimePropertyTests

static char const * const _ORIGIN_KEY   = "origin";
static char const * const _FALSE_KEY    = "nonono";

#pragma mark -
#pragma mark test config

- (void)setUp
{
    [super setUp];
    
    _helloString = @"Hello World!";
    _originString = @"Austria is calling";
    
    [_helloString setProperty:_originString
                       forKey:_ORIGIN_KEY
                   withPolicy:RETAIN_NONATOMIC_POLICY];
    
    _dict = @{@"points":@"1234"};
}

- (void)tearDown
{
    _helloString = nil;
    _originString = nil;
    
    _dict = nil;
    
    [super tearDown];
}

#pragma mark -
#pragma mark Basic Function Testing

- (void)testBasicFunction
{
    STAssertTrue([_helloString hasPropertyForKey:_ORIGIN_KEY],
                 @"should know about this property");
    
    STAssertEqualObjects(_originString, [_helloString getPropertyForKey:_ORIGIN_KEY],
                         @"should be the same object.");
    
    STAssertTrue([_originString isEqualToString:[_helloString getPropertyForKey:_ORIGIN_KEY]],
                 @"should have the same content.");
}

- (void)testThrowing
{
    /**
     TESTING
     - (void)setProperty:(id)property forKey:(char const * const)key withPolicy:(AssociantionPolicy)policy;
     */
    STAssertThrows([_dict setProperty:nil
                              forKey:_ORIGIN_KEY
                          withPolicy:RETAIN_NONATOMIC_POLICY],
                   @"it should not be allowed to set no property.");
    
    STAssertThrows([_dict setProperty:@"PLAYER_ONE"
                              forKey:nil
                          withPolicy:RETAIN_NONATOMIC_POLICY],
                   @"it should not be allowed to set no key.");

    STAssertThrows([_dict setProperty:@"PLAYER_ONE"
                              forKey:_ORIGIN_KEY
                          withPolicy:0],
                   @"it should not be allowed to set a false policy.");
    
    STAssertThrows([_dict setProperty:@"PLAYER_ONE"
                              forKey:_ORIGIN_KEY
                          withPolicy:-1],
                   @"it should not be allowed to set a false policy.");

    /**
     TESTING
     - (id)getPropertyForKey:(char const * const)key;
     */
    
    STAssertThrows([_dict getPropertyForKey:nil], @"it should not be allowed to set no key.");
    
    STAssertThrows([_dict getPropertyForKey:_FALSE_KEY], @"it should not be allowed to query for a not set object.");
    
    /**
     TESTING
     - (BOOL)hasPropertyForKey:(char const * const)key;;
     */
    
    STAssertThrows([_dict hasPropertyForKey:nil], @"it should not be allowed to set no key.");
}

@end
