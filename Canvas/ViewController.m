//
//  ViewController.m
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

@synthesize canvas;
@synthesize testButton;
@synthesize slider;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self generateColorPalette];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveSwapColorNotification:) 
                                                 name:@"pickedColor"
                                               object:nil];

    
    canvas.brushWidth = slider.value;
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * -0.5);
    slider.transform = trans;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void) generateColorPalette
{
    NSArray *colors = [[NSArray alloc] initWithObjects: [UIColor redColor], 
                                                        [UIColor blueColor], 
                                                        [UIColor greenColor], 
                                                        [UIColor blackColor], 
                                                        [UIColor purpleColor], 
                                                        [UIColor yellowColor],
                                                        [UIColor brownColor],
                                                        [UIColor cyanColor],
                                                        [UIColor orangeColor],
                                                        [UIColor lightGrayColor],
                                                        nil];
    
    float yPos = 0;
    float buttonSize = 40;
    
    for (UIColor *col in colors) {
        yPos = [colors indexOfObject:col] * buttonSize;
        testButton = [[ColorButton alloc] initWithFrame:CGRectMake(0, 
                                                                   yPos, 
                                                                   buttonSize, 
                                                                   buttonSize)];
        testButton.color = col;
        [self.view addSubview:testButton];
    } 
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void) receiveSwapColorNotification:(NSNotification *) notification
{
    NSDictionary *userInfo = notification.userInfo;
    UIColor *selectedColor = [userInfo objectForKey:@"color"];
    canvas.currentColor = selectedColor;
}


-(IBAction)switchColor:(id)sender
{
    UIButton *button = (UIButton *) sender;
    if([button.titleLabel.text isEqualToString:@"Red"]){
        canvas.currentColor = [UIColor redColor];
    }else {
        canvas.currentColor = [UIColor greenColor];
    }
}

-(IBAction)selectedClearButton:(id)sender
{
    [canvas clear];
}

-(IBAction)changeBrushWidth:(id)sender
{
    canvas.brushWidth = slider.value;
}

@end
