//
//  SharedStateCollection.h
//  test2
//
//  Created by Stewart Snow on 29/03/2013.
//  Copyright (c) 2013 Stewart Snow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SharedStateItem.h"
#import "GCDAsyncUdpSocket.h"

@interface SharedStateCollection : NSObject
{
    NSMutableArray *CollectionX;
}


- (void) PrintCollection;

- (void) RecieveMessage: (NSString *) Message  TheSocket:(GCDAsyncUdpSocket *) Socket;

- (void) FindAddUpdate: (SharedStateItem *) Item;

- (void) PrintSingleItem: (SharedStateItem *) Item;


@end
