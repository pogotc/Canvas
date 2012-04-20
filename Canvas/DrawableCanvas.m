//
//  DrawableCanvas.m
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import "DrawableCanvas.h"

@implementation DrawableCanvas

@synthesize pathStack;
@synthesize currentPath;
@synthesize currentSegment;
@synthesize currentColor;
@synthesize brushWidth;

- (void) baseInit{
    
    pathStack = [[NSMutableArray alloc] init ];
    currentColor = [UIColor greenColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }  
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    for (DrawnSegment *segment in pathStack){
        [segment.color setStroke];
        [segment.path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    }
}


#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    currentPath=[[UIBezierPath alloc]init];
    currentPath.lineWidth = brushWidth;
    
    currentSegment = [[DrawnSegment alloc] init];
    currentSegment.path = currentPath;
    currentSegment.color = currentColor;
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [currentPath moveToPoint:[mytouch locationInView:self]];
    [pathStack addObject:currentSegment];
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [currentPath addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
}

-(void) clear
{
    [pathStack removeAllObjects];
    [self setNeedsDisplay];
}


@end
