//
//  SessionFactory.m
//  KZDojoFinderWebServiceLibrary
//
//  Created by Shane Whitehead on 23/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>
#import <KZDojoFinderWebServiceClientLibrary/KZDojoFinderWebServiceClientLibrary.h>
#import "WebServiceDojoFinderConsumerProxy.h"

@implementation SessionFactory

+(void)sessionsForDojo:(id<Dojo>)dojo withConsumer:(id<DojoFinderFactoryConsumer>)consumer {
	if ([dojo isKindOfClass:WSDojo.class]) {
		WebServiceDojoFinderConsumerProxy* proxyConsumer = [[WebServiceDojoFinderConsumerProxy alloc]
																												initWithWebService:@"SessionFactory"
																												andDojoFinderFactoryConsumer:consumer];
		
		[SessionWebService sessionForDojo:dojo
												 withConsumer:proxyConsumer];
	} else {

		NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"Instance of Dojo is not compatiable with the Web Services API"};
		NSError* error = [NSError errorWithDomain:@"org.kaizen.dojofinder.webservices.sessionFactory"
												code:404
										userInfo:userInfo];
		[consumer dojoFinderFactory:@"SessionFactory" didFailWithError:error];
		
	}
}

@end