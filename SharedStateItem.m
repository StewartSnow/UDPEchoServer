//
//  SharedStateItem.m
//  test2
//
//  Created by Stewart Snow on 29/03/2013.
//  Copyright (c) 2013 Stewart Snow. All rights reserved.
//

#import "SharedStateItem.h"

@implementation SharedStateItem
@synthesize JoinNumber, JoinType, JoinValue;

-(int) ParseMessage:(NSString *)message
{
    //message=d123:hello!
    
    BOOL result;
    
    result = [message hasPrefix: @"message="];
    
    if (result)
    {
        
        JoinType = [message substringWithRange: NSMakeRange(8,1)];
    
        NSRange matchcolon;
        matchcolon = [message rangeOfString: @":"];
    
        int ColonPosition;
    
        ColonPosition = matchcolon.location;
    
        NSRange matchend;
        matchend = [message rangeOfString: @"!"];
    
        int EndPosition;
    
        EndPosition = matchend.location;
    
    
        JoinNumber =  [message substringWithRange:NSMakeRange(9,ColonPosition - 9)];
    
        int ValueLength;
        ValueLength = EndPosition - ColonPosition - 1;
    
        JoinValue = [message substringWithRange:NSMakeRange(ColonPosition + 1,ValueLength)];
        
        return 0;
    }
    else
    {
        return 1;
    }
    
}

- (NSString *) CreateMessage
{
    NSMutableString * MSG = [NSMutableString stringWithCapacity:100];
    
    [MSG appendString:@"message="];
    [MSG appendString: [self JoinType]];
    [MSG appendString: [self JoinNumber]];
    [MSG appendString: @":"];
    [MSG appendString: [self JoinValue]];
    [MSG appendString: @"!"];
    

    //+ [self JoinType] + [self JoinNumber] + @":" + [self JoinValue] + @"!";
    
    return MSG;
}

@end
