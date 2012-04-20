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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
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

@end
