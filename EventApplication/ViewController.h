//
//  ViewController.h
//  EventExercise
//
//  Created by Vikash Soni on 10/09/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>

@interface ViewController : UIViewController<EKEventEditViewDelegate>
{
}

-(IBAction)eventButton :(id)sender;
@end
