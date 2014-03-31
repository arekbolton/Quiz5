//
//  Quiz5DetailViewController.h
//  Quiz5
//
//  Created by Arek Bolton on 3/16/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@interface Quiz5DetailViewController : UIViewController <UITextFieldDelegate>
{
    
    __weak IBOutlet UITextField *taskNameText;
    __weak IBOutlet UILabel *taskTableName;
    __weak IBOutlet UILabel *urgencyText;
    __weak IBOutlet UISlider *urgencySlider;
    __weak IBOutlet UIDatePicker *datePicker;
    
}

@property (nonatomic, strong) Task *task;
@property (nonatomic, weak) NSDate *taskDate;

- (IBAction)urgencySliderAct: (id)sender;


@end
