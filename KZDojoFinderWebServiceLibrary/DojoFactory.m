//
//  DojoFactory.m
//  KZDojoFinderWebServiceLibrary
//
//  Created by Shane Whitehead on 22/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>
#import <KZDojoFinderWebServiceClientLibrary/KZDojoFinderWebServiceClientLibrary.h>
#import "WebServiceDojoFinderConsumerProxy.h"

@implementation DojoFactory

+(void)dojosNear:(CLLocation *)userPoint withinKilometers:(double)range withConsumer:(id<DojoFinderFactoryConsumer>)consumer {
	
	// It would probably be nice to put this in a utility class somewhere, as I seem to keep on using it...
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userPoint.coordinate, range * 1000, range * 1000);
	
	CLLocationCoordinate2D start = CLLocationCoordinate2DMake(region.center.latitude + (region.span.latitudeDelta / 2.0),
																														region.center.longitude - (region.span.longitudeDelta / 2.0));
	CLLocationCoordinate2D end = CLLocationCoordinate2DMake(region.center.latitude - (region.span.latitudeDelta / 2.0),
																													region.center.longitude + (region.span.longitudeDelta / 2.0));

	WebServiceDojoFinderConsumerProxy* proxyConsumer = [[WebServiceDojoFinderConsumerProxy alloc]
																											initWithWebService:@"DojoFactory"
																											andDojoFinderFactoryConsumer:consumer];
	[DojoWebService dojosWithin:start
													 to:end
								 withConsumer:proxyConsumer];
	
}
@end
