//
//  DrawnSegment.h
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawnSegment : NSObject

@property (strong, nonatomic) UIBezierPath *path;
@property (strong, nonatomic) UIColor *color;

@end
