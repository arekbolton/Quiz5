//
//  Quiz5ViewController.m
//  Quiz5
//
//
//  Created by Arek Bolton on 3/16/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//


#import "Quiz5ViewController.h"
#import "Quiz5DetailViewController.h"
#import "Task.h"

@interface Quiz5ViewController ()
@end

@implementation Quiz5ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"My Tasks"];
    tasks = [[NSMutableArray alloc] init];
    [self.tableView setDelegate: self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    for (int i=0; i<10; i++) {
        Task *task = [[Task alloc] init];
        [task setTaskName:[NSString stringWithFormat:@"Task %d",i]];
        [task setUrgency:i];
        [task setDueDate:[NSDate dateWithTimeIntervalSinceNow:i*60.0*60.0*24.0]];
        [tasks addObject:task];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [tasks sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Task *t1=obj1;
        Task *t2 = obj2;
        return [t1.dueDate compare:t2.dueDate];
    }];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    // Configure the cell...
    Task *t = [tasks objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[t taskName]];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle: NSDateFormatterLongStyle];
    [cell.detailTextLabel setText:[df stringFromDate:t.dueDate]];
    if (t.urgency > 6) {
        [[cell imageView] setImage:[UIImage imageNamed:@"urgent.jpg"]];
    } else {
        [[cell imageView] setImage: nil];
    }
    cell.contentView.backgroundColor = [UIColor colorWithRed:(t.urgency/10) green:(1-(t.urgency/10)) blue:0 alpha:.3];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Quiz5DetailViewController *detailViewController = [[Quiz5DetailViewController alloc] init];
    Quiz5DetailViewController *dvc = [[Quiz5DetailViewController alloc] initWithNibName:@"Quiz5DetailViewController" bundle:nil];
    [dvc setTask:[tasks objectAtIndex:[indexPath row]]];
    [[self navigationController] pushViewController:dvc animated:YES];
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
     // Return NO if you do not want the specified item to be editable.
     return YES;
 }

 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         // Delete the row from the data source
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     }else if (editingStyle == UITableViewCellEditingStyleInsert) {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
 }

 // Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
