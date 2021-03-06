//
//  ViewController.h
//  Canvas
//
//  Created by Steve Ellis on 20/04/2012.
//  Copyright (c) 2012 Made Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawableCanvas.h"
#import "ColorButton.h"

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet DrawableCanvas *canvas;    
@property (nonatomic, retain) IBOutlet ColorButton *testButton;
@property (nonatomic, retain) IBOutlet UISlider *slider;

-(void) generateColorPalette;
-(IBAction)selectedClearButton:(id)sender;
-(IBAction)changeBrushWidth:(id)sender;
-(IBAction)pressedUndoButton:(id)sender;
-(IBAction)pressedRedoButton:(id)sender;

@end
