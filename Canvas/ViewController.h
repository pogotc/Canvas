//
//  ViewController.h
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawableCanvas.h"

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet DrawableCanvas *canvas;    

-(IBAction)switchColor:(id)sender;

@end
