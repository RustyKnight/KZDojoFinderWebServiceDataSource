//
//  WebServiceDojoFinderConsumerProxy.h
//  KZDojoFinderWebServiceLibrary
//
//  Created by Shane Whitehead on 22/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>
#import <KZDojoFinderWebServiceClientLibrary/KZDojoFinderWebServiceClientLibrary.h>

@interface WebServiceDojoFinderConsumerProxy : NSObject <WebServiceConsumer>

-initWithWebService:(NSString* _Nonnull)name andDojoFinderFactoryConsumer:(id<DojoFinderFactoryConsumer> _Nonnull)consumer;
@property (strong, nonatomic, readonly, nonnull)id<DojoFinderFactoryConsumer> dojoFinderFactoryConsumer;
@property (strong, nonatomic, readonly, nonnull)NSString* factoryName;

@end
