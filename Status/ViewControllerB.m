//
//  ViewControllerB.m
//  Status
//
//  Created by Spencer Kamchee on 3/9/16.
//  Copyright © 2016 Spencer Kamchee. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

    
    [self presentStatusView];
    UILabel* label = self.progressLabel;
    [label setText:@"Loading B"];
    
    dispatch_queue_t myQueue = dispatch_queue_create("backgroundQueue",NULL);
    dispatch_async(myQueue, ^{
        // Perform long running process
        [NSThread sleepForTimeInterval:5];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissStatusView];
        });
        
    });
}

@end
