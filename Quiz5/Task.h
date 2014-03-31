//
//  Task.h
//  Quiz5
//
//  Created by Arek Bolton on 3/16/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic) float urgency;
@property (nonatomic, retain) NSDate *dueDate;
@property (nonatomic, retain) NSString *taskName;
@end
