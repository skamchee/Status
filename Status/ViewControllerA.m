//
//  ViewControllerA.m
//  Status
//
//  Created by Spencer Kamchee on 3/9/16.
//  Copyright © 2016 Spencer Kamchee. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
    [self presentStatusView];
    UILabel* label = self.progressLabel;
    [label setText:@"Loading A"];
    
    dispatch_queue_t myQueue = dispatch_queue_create("backgroundQueue",NULL);
    dispatch_async(myQueue, ^{
        // Perform long running process
        [NSThread sleepForTimeInterval:5];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissStatusView];
        });
        
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
