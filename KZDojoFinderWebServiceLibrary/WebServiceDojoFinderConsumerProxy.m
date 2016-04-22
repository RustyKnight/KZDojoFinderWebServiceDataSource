//
//  WebServiceDojoFinderConsumerProxy.m
//  KZDojoFinderWebServiceLibrary
//
//  Created by Shane Whitehead on 22/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import "WebServiceDojoFinderConsumerProxy.h"

@implementation WebServiceDojoFinderConsumerProxy

@synthesize dojoFinderFactoryConsumer;
@synthesize factoryName;

-(id)initWithWebService:(NSString *)name andDojoFinderFactoryConsumer:(id<DojoFinderFactoryConsumer>)consumer {
	if (self = [super init]) {
		factoryName = name;
		dojoFinderFactoryConsumer = consumer;
	}
	return self;
}

-(void)webService:(WebService *)webService progressDidChange:(NSNumber *)progress {
	[self.dojoFinderFactoryConsumer dojoFinderFactory:self.factoryName progressDidChange:progress];
}

-(void)webService:(WebService *)webService didFailWithError:(NSError *)error {
	[self.dojoFinderFactoryConsumer dojoFinderFactory:self.factoryName didFailWithError:error];
}

-(void)webService:(WebService *)webService didCompleteWith:(NSObject *)data {
	[self.dojoFinderFactoryConsumer dojoFinderFactory:self.factoryName didCompleteWith:data];
}
@end
