//
//  RegionContactFactory.m
//  KZDojoFinderWebServiceLibrary
//
//  Created by Shane Whitehead on 23/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <Foundation/Foundation.h>
@import KZDojoFinderLibrary;
@import KZDojoFinderWebServiceClientLibrary;
#import "WebServiceDojoFinderConsumerProxy.h"

@implementation RegionContactFactory

+(void)regionContactForRegion:(NSInteger)region withConsumer:(id<DojoFinderFactoryConsumer>)consumer {

	WebServiceDojoFinderConsumerProxy* proxyConsumer = [[WebServiceDojoFinderConsumerProxy alloc]
																											initWithWebService:@"RegionContactFactory"
																											andDojoFinderFactoryConsumer:consumer];
	[RegionContactWebService regionContactForRegion:region
																			withConsume:proxyConsumer];

}

@end
