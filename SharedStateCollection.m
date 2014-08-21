//
//  SharedStateCollection.m
//  test2
//
//  Created by Stewart Snow on 29/03/2013.
//  Copyright (c) 2013 Stewart Snow. All rights reserved.
//

#import "SharedStateCollection.h"

@implementation SharedStateCollection

- (id) init
{
    self = [super init];
    if (self) {
         CollectionX = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) PrintCollection
{
    for (SharedStateItem * myItem in CollectionX)
    {
        [self PrintSingleItem:myItem];
    }
};

- (void) RecieveMessage: (NSString *) Message  TheSocket:(GCDAsyncUdpSocket *) Socket;
{
    SharedStateItem * Item = [[SharedStateItem alloc] init];
    
    if ([Item ParseMessage:Message] == 0)
    {
        [self FindAddUpdate: Item];
    }
    else
    {
        if ([Message isEqualToString: @"ReturnStates"])
        {
            //return states
            NSLog(@"return Stats");
            for (SharedStateItem * myItem in CollectionX) {
                NSString * msg = [myItem CreateMessage];
                
               NSLog(@" %@", msg);
                
                NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
                [Socket sendData:data toHost:@"255.255.255.255" port:19107 withTimeout:-1 tag:0];
                
            }
        }
        else
        {
            //message not in correct format
        }
    }
}



- (void) FindAddUpdate: (SharedStateItem *) Item
{
    int found = 0;
    for (SharedStateItem * myItem in CollectionX) {
        NSLog(@"compare %@ and %@", [myItem JoinNumber], [Item JoinNumber]);
        if ([[myItem JoinNumber] intValue] == [[Item JoinNumber] intValue])
        {
                    NSLog(@"updating join %@", [Item JoinNumber]);
            myItem.JoinValue = Item.JoinValue;
            
            found =1;
        }
        //[self PrintStateItem: myItem]
    }
    if (found == 0)
    {
        NSLog(@"adding join %@", [Item JoinNumber]);
        [CollectionX addObject: Item];
        
    }
}

- (void) PrintSingleItem: (SharedStateItem *) Item
{
        NSLog(@"JoinNumber - %@ JoinType - %@ JoinValue - %@", [Item JoinNumber], [Item JoinType], [Item JoinValue]);
}

@end
