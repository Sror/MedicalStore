//
//  GGApiParser.h
//  WeiGongAn
//
//  Created by dong yiming on 13-4-2.
//  Copyright (c) 2013年 WeiGongAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSUserInfo;
@class NSData;

@interface GGApiParser : NSObject
@property (strong)  NSDictionary    *apiData;
@property (strong)  NSArray    *apiArray;
@property (strong)  NSData    *rawData;

#pragma mark - init
+(id)parserWithRawData:(NSData *)aRawData;
-(id)initWithRawData:(NSData *)aRawData;

+(NSData *) dealwithencode:(NSData *)aRawData;

+(id)parserWithArray:(NSArray *)anApiData;
-(id)initWithArray:(NSArray *)anApiData;

+(id)parserWithApiData:(NSDictionary *)anApiData;
-(id)initWithApiData:(NSDictionary *)anApiData;

-(long)typeID;

-(NSMutableArray *)parseMSDepartMent;
-(MSUserInfo *)parseMSUserInfo;
-(NSMutableArray *)parseMSTelBook;

@end
