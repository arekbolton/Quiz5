//
//  Quiz5DetailViewController.m
//  Quiz5
//
//  Created by Arek Bolton on 3/16/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import "Quiz5DetailViewController.h"
#import "Task.h"
@implementation Quiz5DetailViewController
@synthesize task;

- (void)setItem:(Task *)t
{
    task = t;
    [[self navigationItem] setTitle:[task taskName]];
}

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
    [taskNameText setText:[task taskName]];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [taskNameText setDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [[self view] endEditing:YES];
    
    [task setTaskName: taskNameText.text];
    [task setDueDate: datePicker.date];
    [task setUrgency: urgencySlider.value];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [taskNameText setText:task.taskName];
    [datePicker setDate:task.dueDate animated:YES];
    [urgencySlider setValue:task.urgency animated:YES];
    [urgencyText setText:[NSString stringWithFormat:@"%i", (int)urgencySlider.value]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    // Use filtered NSDate object to set dateLabel contents
    //[dateLabel setText:[dateFormatter stringFromDate:[task dateCreated]]];
    
    // Change the navigation item to display name of item
    [[self navigationController] setTitle:[task taskName]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)urgencySliderAct:(id)sender {
    [urgencyText setText:[NSString stringWithFormat:@"%i", (int)urgencySlider.value]];
    [task setUrgency: urgencySlider.value];
}

@end
