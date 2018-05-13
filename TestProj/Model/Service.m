//
//  SBTService.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "Service.h"
#import "defines.h"

#import "Entity.h"
#import "Visit.h"
#import "Organization.h"


static NSString *const Service_baseURLString = @"https://demo3526062.mockable.io";

@interface Service ()
@property (nonatomic, nonnull, strong) NSURLSession *session;
@property (nonatomic, nonnull, strong) NSURL *baseURL;
@end

@implementation Service


+ (instancetype)createWithSession:(NSURLSession *)session{
    Service *obj = [Service new];
    obj.session = (session ? : NSURLSession.sharedSession);

    return obj;
}

- (void)call:(SBTServiceEndpoint)endpoint completion:(void (^)(NSData *_Nullable, NSURLResponse *_Nullable, NSError *_Nullable))completion{
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[self urlForEndpoint:endpoint]];
    req.HTTPMethod = [self httpMethodForEndpoint:endpoint];
    
    [[self.session dataTaskWithRequest:req completionHandler:completion] resume];
}

- (void)getVisitListWithCompletion:(void (^)(NSArray<SBTVisit *> *_Nonnull))completion{
    [self call:SBTServiceEndpoint_getVisitList completion:^(NSData *_Nullable data, NSURLResponse *_Nullable resp, NSError *_Nullable error) {

        if( !data || error ) {
            NSLog(@"Response error = %@ resp = %@", error, resp);
            SAFE_RUN(completion, @[]);
            return;
        }


        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

        if( !jsonData || error ) {
            NSLog(@"Couldn't parse data error = %@", error);
            SAFE_RUN(completion, @[]);
            return;
        }

        NSArray *array = [self parseJSON:jsonData into:[Visit class]];
        SAFE_RUN(completion, array);
    }];
}


- (void)getOrganizationListWithCompletion:(void (^)(NSArray<Organization *> *_Nonnull))completion{
    [self call:SBTServiceEndpoint_getOrganizationList completion:^(NSData *_Nullable data, NSURLResponse *_Nullable resp, NSError *_Nullable error) {

        if( !data || error ) {
           NSLog(@"Response error = %@ resp = %@", error, resp);
            SAFE_RUN(completion, @[]);
            return;
        }

        
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

        if( !jsonData || error ) {
          NSLog(@"Couldn't parse data error = %@", error);
          SAFE_RUN(completion, @[]);
            return;
        }

        
        NSArray *array = [self parseJSON:jsonData into:[Organization class]];
        SAFE_RUN(completion, array);
    }];
}

- (NSArray *)parseJSON:(id)json into:(Class<Entity>)class
{
    json = [json isKindOfClass:NSArray.class] ? json : @[json];
    NSMutableArray *array = [NSMutableArray array];
    
    for( NSDictionary *itemData in (NSArray *)json ) {
        id obj = [class createWithJSON:itemData];
        
        if( !obj ) {
            NSLog(@"couldn't parse item = %@", itemData);
            continue;
        }
        
        [array addObject:obj];
    }
    
    return [array copy];
}

- (NSURL *)baseURL{
    static NSURL *_baseURL = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _baseURL = [NSURL URLWithString:Service_baseURLString];
    });

    return _baseURL;
}

- (NSURLSession *)session{
    if( !_session ){
        _session = NSURLSession.sharedSession;
    }
    return _session;
}

- (NSURL *)urlForEndpoint:(SBTServiceEndpoint)endpoint{
    switch( endpoint ) {
        case SBTServiceEndpoint_getVisitList: {
            return [NSURL URLWithString:@"/getVisitsListTest" relativeToURL:self.baseURL];
        }
        case SBTServiceEndpoint_getOrganizationList: {
            return [NSURL URLWithString:@"/getOrganizationListTest" relativeToURL:self.baseURL];
        }
    }
}

- (NSString *)httpMethodForEndpoint:(SBTServiceEndpoint)endpoint{
    return @"GET";
}

@end



