//
//  TemperatureCountLabel.m
//  YXMWeather
//
//  Created by XianMingYou on 15/2/22.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "TemperatureCountLabel.h"

@interface TemperatureCountLabel ()<NumberCountDelegate>

@end

@implementation TemperatureCountLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.countLabel               = [[UILabel alloc] initWithFrame:self.bounds];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.countLabel];
        self.countLabel.alpha         = 0;
        self.countLabel.numberOfLines = 0;
        
        self.temperatureCount          = [TemperatureCount new];
        self.temperatureCount.delegate = self;
    }
    return self;
}

- (void)numberCount:(NumberCount *)numberCount currentSting:(NSAttributedString *)string {
    self.countLabel.attributedText = string;
}

- (void)showDuration:(CGFloat)duration {
    self.temperatureCount.fromValue = self.fromValue;
    self.temperatureCount.toValue   = self.toValue;
    self.temperatureCount.duration  = duration;
    
    [self.temperatureCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.alpha     = 1.f;
    }];
}

- (void)hideDuration:(CGFloat)duration {
//    self.temperatureCount.fromValue = self.toValue;
//    self.temperatureCount.toValue   = 0;
//    self.temperatureCount.duration  = duration;
//    
//    [self.temperatureCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.alpha     = 0.f;
    }];
}


@end
