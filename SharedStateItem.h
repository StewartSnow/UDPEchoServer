//
//  SharedStateItem.h
//  test2
//
//  Created by Stewart Snow on 29/03/2013.
//  Copyright (c) 2013 Stewart Snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedStateItem : NSObject {
    NSNumber* JoinNumber;
    NSString* JoinType;
    NSString* JoinValue;
}

@property(readwrite, retain) NSNumber* JoinNumber;
@property(readwrite, retain) NSString* JoinType;
@property(readwrite, retain) NSString* JoinValue;


- (int) ParseMessage: (NSString*)message;

- (NSString *) CreateMessage;


@end
