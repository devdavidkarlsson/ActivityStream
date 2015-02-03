//
//  ViewController.m
//  ActivityStream
//
//  Created by David Karlsson on 30/01/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import "ViewController.h"
#import "ActivityStreamService.h"
#import "AppDelegate.h"


@interface ViewController ()<ActivityStreamServiceDelegate, UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self activityStreamService].delegate = self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)refreshData:(id)sender {
    [[self activityStreamService] getAll];
}
- (IBAction)buttonPressed:(id)sender {
    
    @try{
        ActivityStreamObject* obj;
        int restorationId=((UIButton*)sender).restorationIdentifier.intValue;
        switch (restorationId) {
            case 1:
                NSLog(@"case1");
            obj = [[ActivityStreamObject alloc] initWithData:@"drank" actor:nameField.text object:@" coffe"];
            break;
            case 2:
                NSLog(@"case2");
            obj = [[ActivityStreamObject alloc] initWithData:@"drank" actor:nameField.text object:@"tea"];

            break;
            case 3:
                NSLog(@"case3");
            obj = [[ActivityStreamObject alloc] initWithData:@"drank" actor:nameField.text object:@"water"];

            break;
        
            default:
                [NSException raise:@"Invalid button value" format:@"restorationIdentifier %d is invalid", restorationId];
            break;
            
        }
        if (obj) {
            
            [[self activityStreamService]set:obj];
            NSLog(@"Posted");
        }
    }
    @catch(NSException *e){
        NSLog([NSString stringWithFormat:@"Error: %@", [e reason]] );
    }
}


// Model:

-(void) modelUpdated{
    NSLog(@"View update triggered %lu", (unsigned long)[self.activityStreamService.streamObjects count]);
    [_tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    
}

- (ActivityStreamService*) activityStreamService
{
    return [AppDelegate appDelegate].activityStreamService;
}


//Table View:

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of elements in table: %lu", (unsigned long)[self.activityStreamService.streamObjects count]);
    return [self.activityStreamService.streamObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //NSLog(@"INDEXPATH.ROW: %d", indexPath.row);
    cell.textLabel.text = [((ActivityStreamObject
                            *)[self.activityStreamService.streamObjects objectAtIndex:indexPath.row]) toString];
    return cell;
}



@end
