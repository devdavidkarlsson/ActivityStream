//
//  ViewController.h
//  ActivityStream
//
//  Created by David Karlsson on 30/01/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    

IBOutlet UIButton* button1;
IBOutlet UIButton* button2;
IBOutlet UIButton* button3;
IBOutlet UITableView * tableView;

    __weak IBOutlet UITextField *nameField;
}

@property (nonatomic, weak) IBOutlet UITableView* tableView;
- (IBAction)buttonPressed:(id)sender;


@end

