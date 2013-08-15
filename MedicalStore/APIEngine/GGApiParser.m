//
//  GGApiParser.m
//  WeiGongAn
//
//  Created by dong yiming on 13-4-2.
//  Copyright (c) 2013年 WeiGongAn. All rights reserved.
//

#import "GGApiParser.h"
#import "SBJsonParser.h"
#import "GGDataModel.h"

#define GG_ASSERT_API_DATA_IS_DIC   NSAssert([_apiData isKindOfClass:[NSDictionary class]], @"Api Data should be a NSDictionary");

#define GG_ASSERT_API_DATA_IS_ARR   NSAssert([_apiArray isKindOfClass:[NSArray class]], @"Api Data should be a NSArray");

@implementation GGApiParser

#pragma mark - init
+(id)parserWithRawData:(NSData *)aRawData
{
    if (aRawData == nil || ![aRawData isKindOfClass:[NSData class]]) {
        return nil;
    }
    
    GGApiParser * parser = nil;
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    id object = [jsonParser objectWithData:aRawData];
    
    if ([object isKindOfClass:[NSDictionary class]])
    {
        parser = [[self alloc] initWithApiData:object];
    }
    else if ([object isKindOfClass:[NSArray class]])
    {
        parser = [[self alloc] initWithArray:object];

    }
    
    return parser;
}

-(id)initWithRawData:(NSData *)aRawData
{
    self = [super init];
    if (self) {
        _rawData = aRawData;
    }
    
    return self;
}

+(id)parserWithArray:(NSArray *)anApiData
{
    if (anApiData == nil || ![anApiData isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    GGApiParser * parser = [[self alloc] initWithArray:anApiData];
    return parser;
}

-(id)initWithArray:(NSArray *)anApiData
{
    self = [super init];
    if (self) {
        _apiArray = anApiData;
    }
    
    return self;
}

+(id)parserWithApiData:(NSDictionary *)anApiData
{
    if (anApiData == nil || ![anApiData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    GGApiParser * parser = [[self alloc] initWithApiData:anApiData];
    return parser;
}

-(id)initWithApiData:(NSDictionary *)anApiData
{
    self = [super init];
    if (self) {
        _apiData = anApiData;
    }
    
    return self;
}

-(long)typeID
{
    GG_ASSERT_API_DATA_IS_ARR;
    id firstElement = _apiArray[0];
    return [[firstElement objectForKey:@"typeId"] longValue];
}

#pragma mark - internal
-(NSMutableArray *)_parseArrForClass:(Class)aClass
{
    //判断json第一个元素 是不是{"typeId":0}
    id firstElement = _apiArray[0];
    int k = 0;
    if ([firstElement objectForKey:@"typeId"]) {
        k = 1;
    }
    NSMutableArray *array = [NSMutableArray array];
    for (int i = k; i < _apiArray.count; i++)
    {
        id data = _apiArray[i];
        id area = [aClass model];
        [area parseWithData:data];
        [array addObject:area];
    }
    
    return array;
}


@end
