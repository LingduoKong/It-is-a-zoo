//
//  Animal.m
//  It's a Zoo there
//
//  Created by Lingduo Kong on 1/15/15.
//  Copyright (c) 2015 Lingduo Kong. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(NSString*)description{
    NSString *descriptionString =
    [NSString stringWithFormat:@"Animal Name:%@ \n Species:%@ \n Age: %@ \n", self.name, self.species, self.age];
    
    NSLog(@"Animal Object: name=%@, species=%@, age=%@, image=%@", self.name,self.species,self.age,self.image);
    
    return descriptionString;
}

@end
