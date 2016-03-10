//
//  UIViewController+Status.h
//  Status
//
//  Created by Spencer Kamchee on 3/9/16.
//  Copyright © 2016 Spencer Kamchee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (Status)

@property(strong,nonatomic)UIView* statusView;
@property(strong,nonatomic)UILabel* progressLabel;
@property (strong, nonatomic)UIActivityIndicatorView *activityIndicator;

-(void)presentStatusView;
-(void)dismissStatusView;


@end
