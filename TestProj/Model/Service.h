//
//  SBTService.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBTVisit;
@class Organization;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef NS_ENUM (NSUInteger, SBTServiceEndpoint) {
    SBTServiceEndpoint_getVisitList,
    SBTServiceEndpoint_getOrganizationList
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@protocol Service <NSObject>
- (void)getVisitListWithCompletion:( nonnull void(^)(NSArray<SBTVisit *> *_Nonnull list) )completion;
- (void)getOrganizationListWithCompletion:( nonnull void(^)(NSArray<Organization *> *_Nonnull list) )completion;
@end

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface Service : NSObject <Service>

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

+ (nonnull instancetype)createWithSession:(nullable NSURLSession *)session;

//- (void)call:(SBTServiceEndpoint)endpoint completion:( nonnull void(^)(NSData * _Nullable data, NSURLResponse * _Nullable resp, NSError * _Nullable error) )completion;

- (void)getVisitListWithCompletion:( nonnull void(^)(NSArray<SBTVisit *> *_Nonnull list) )completion;
- (void)getOrganizationListWithCompletion:( nonnull void(^)(NSArray<Organization *> *_Nonnull list) )completion;

@end



