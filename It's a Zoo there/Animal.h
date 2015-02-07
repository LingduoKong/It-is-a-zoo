//
//  Animal.h
//  It's a Zoo there
//
//  Created by Lingduo Kong on 1/15/15.
//  Copyright (c) 2015 Lingduo Kong. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Animal : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *species;
@property (strong, nonatomic) NSNumber *age;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *soundPath;

- (NSString*)description;

@end
