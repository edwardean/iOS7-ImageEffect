//
//  ViewController.m
//  ImageEffectDemo
//
//  Created by line0 on 13-8-2.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *effectSeg;
- (IBAction)effectSegmentValueChanged:(UISegmentedControl *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self lightEffect];
}

- (void)lightEffect
{
    UIImage *image = [[UIImage imageNamed:@"Image"] applyLightEffect];
    [self.imageView setImage:image];
}

- (void)extraLightEffect
{
    UIImage *image = [[UIImage imageNamed:@"Image"] applyExtraLightEffect];
    [self.imageView setImage:image];
}

- (void)darkEffect
{
    UIImage *image = [[UIImage imageNamed:@"Image"] applyDarkEffect];
    [self.imageView setImage:image];
}

- (void)custom1Effect
{
    UIImage *image = [[UIImage imageNamed:@"Image"] applyTintEffectWithColor:[[UIColor grayColor] colorWithAlphaComponent:0.2]];
    [self.imageView setImage:image];
}

- (void)custom2Effect
{
    UIColor *tintColor = [[UIColor greenColor] colorWithAlphaComponent:0.1];
    UIImage *mastImage = [UIImage imageNamed:@"Image"];
    UIImage *image = [[UIImage imageNamed:@"bgImage"] applyBlurWithRadius:20 tintColor:tintColor saturationDeltaFactor:1 maskImage:mastImage];
    [self.imageView setImage:image];
}

- (IBAction)effectSegmentValueChanged:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            [self lightEffect];
            break;
        case 1:
            [self extraLightEffect];
            break;
        case 2:
            [self darkEffect];
            break;
        case 3:
            [self custom1Effect];
            break;
        case 4:
            [self custom2Effect];
            break;
        default:
            break;
    }
}


@end
