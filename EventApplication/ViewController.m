//
//  ViewController.m
//  EventExercise
//
//  Created by Vikash Soni on 10/09/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "ViewController.h"
#import <EventKitUI/EventKitUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)eventButton:(id)sender
{
    EKEventStore *eventStore = [[EKEventStore alloc]init];
    EKEventEditViewController *controller = [[EKEventEditViewController alloc]init];
    
    if ([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
         {
             if ( granted )
             {
                 NSLog(@"User has granted permission!");
             }
             else
             {
                 NSLog(@"User has not granted permission!");
             }
         }];
    }
    controller.editViewDelegate = self;
    controller.eventStore = eventStore;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction: (EKEventEditViewAction)action
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
