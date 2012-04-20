//
//  ColorButton.m
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton

@synthesize color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void) setColor:(UIColor *)newColor
{
    color = newColor;
    [self setBackgroundColor:color];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:color forKey:@"color"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pickedColor" object:nil userInfo: userInfo ];
}

@end
