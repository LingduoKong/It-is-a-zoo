//
//  NSArray+Shuffle.m
//  It's a Zoo there
//
//  Created by Lingduo Kong on 1/26/15.
//  Copyright (c) 2015 Lingduo Kong. All rights reserved.
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)
- (NSArray*)shuffle
{
    // create temporary mutable array
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id anObject in self) {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    return [NSArray arrayWithArray:tmpArray];
}
@end
