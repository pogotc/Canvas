//
//  DrawableCanvas.h
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawnSegment.h"

@interface DrawableCanvas : UIView

@property (nonatomic, retain) NSMutableArray *pathStack;
@property (nonatomic, retain) UIBezierPath *currentPath;
@property (nonatomic, retain) DrawnSegment *currentSegment;
@property (nonatomic, retain) UIColor *currentColor;
@property (nonatomic) float brushWidth;

-(void) clear;

@end
