//
//  ViewController.m
//  It's a Zoo there
//
//  Created by Lingduo Kong on 1/15/15.
//  Copyright (c) 2015 Lingduo Kong. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Shuffle.h"

@implementation ViewController

//-(void)viewDidappear:(BOOL)animated{
//    [super viewDidAppear: animated];
//    [super viewDidLoad];
//}

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    CGFloat pageWidth = scrollView.frame.size.width;
//    float fractionalPage = scrollView.contentOffset.x / pageWidth;
//    NSInteger page = lround(fractionalPage);
//    NSString *name = [[_animal objectAtIndex:page] soundPath];
//    _label.text = name;
//    
//}

//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    CGFloat pageWidth = scrollView.frame.size.width;
//    float fractionalPage = scrollView.contentOffset.x / pageWidth;
//    NSInteger page = lround(fractionalPage);
//    NSString *name = [[_animal objectAtIndex:page] soundPath];
//    _label.text = name;
//    
//    [UIView animateWithDuration:0 animations:^{
//        _label.alpha = 0;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1 animations:^{
//            _label.alpha = 1;
//        } completion:^(BOOL finished) {
//        }];
//    }];
//}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    NSString *name = [[_animal objectAtIndex:page] soundPath];
    _label.text = name;
    
    [UIView animateWithDuration:1 animations:^{
        _label.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            _label.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    }];
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [UIView animateWithDuration:1 animations:^{
        _label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            _label.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.contentSize = CGSizeMake(960, 500);
    _scrollView.delegate = self;
    
    Animal *cat = [[Animal alloc] init];
    cat.name = @"Ketty";
    cat.species = @"Persian cat";
    cat.age = @2;
    cat.image = [UIImage imageNamed:@"cat"];
    cat.soundPath = @"cat";
    
    Animal *dog = [[Animal alloc] init];
    dog.name = @"Boby";
    dog.species = @"great Dan";
    dog.age = @1;
    dog.image = [UIImage imageNamed:@"dog"];
    dog.soundPath = @"dog";
    
    Animal *pig = [[Animal alloc] init];
    pig.name = @"Pipy";
    pig.species = @"pig species";
    pig.age = @3;
    pig.image = [UIImage imageNamed:@"pig"];
    pig.soundPath = @"pig";
    
    _animal = [[NSArray arrayWithObjects:cat,dog,pig,nil] shuffle];
    
    for (NSUInteger i = 0; i < 3; i++){
        Animal *temp = [_animal objectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = i;
        [button setTitle:[temp name] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        button.layer.cornerRadius = 10;
        button.clipsToBounds = YES;
        [button setFrame:CGRectMake(120 + i*320,430,80,30)];
        [self.scrollView addSubview:button];
        [button addTarget:self action:@selector(pressButton:) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:temp.image];
        image.tag = i;
        [image setFrame:CGRectMake(i*320, 50, 320, 350)];
        [self.scrollView addSubview:image];
    }
    
    NSString *name = [[_animal objectAtIndex:0] soundPath];
    _label.text = name;
    
}


-(void) pressButton: (UIButton *)sender {
    
    int index = sender.tag;
    
    Animal *temp = [_animal objectAtIndex:index];
    
    NSString *str = temp.description;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:[temp soundPath] ofType:@"mp3"]];
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    player.volume=0.8;
    [player play];
    
}


- (void)viewWillAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




