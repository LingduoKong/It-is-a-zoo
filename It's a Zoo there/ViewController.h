//
//  ViewController.h
//  It's a Zoo there
//
//  Created by Lingduo Kong on 1/15/15.
//  Copyright (c) 2015 Lingduo Kong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <audiotoolbox/AudioToolbox.h>
#import "Animal.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    AVAudioPlayer *player;
}

@property (nonatomic, strong)NSArray *animal;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (assign) id<UIScrollViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


