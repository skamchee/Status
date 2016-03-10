//
//  UIViewController+Status.m
//  Status
//
//  Created by Spencer Kamchee on 3/9/16.
//  Copyright © 2016 Spencer Kamchee. All rights reserved.
//

#import "UIViewController+Status.h"

@implementation UIViewController (Status)

@dynamic statusView;
@dynamic progressLabel;
@dynamic activityIndicator;

- (void)setStatusView:(UIView *)statusView{
    objc_setAssociatedObject(self, @selector(statusView), statusView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView*)statusView{
    return objc_getAssociatedObject(self, @selector(statusView));
}

- (void)setProgressLabel:(UILabel *)progressLabel{
    objc_setAssociatedObject(self, @selector(progressLabel), progressLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel*)progressLabel{
    return objc_getAssociatedObject(self, @selector(progressLabel));
}

-(void)setActivityIndicator:(UIActivityIndicatorView *)activityIndicator{
    objc_setAssociatedObject(self, @selector(activityIndicator), activityIndicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView*)activityIndicator{
    return objc_getAssociatedObject(self, @selector(activityIndicator));
}

-(void)loadStatusView{
    //Important to set the owner to self. That is the only way to make the connection between the properties on the class that uses this category and the nib itself.
    NSArray *topLevelNibObjects = [[NSBundle mainBundle] loadNibNamed:@"Status" owner:self options:nil];
    //Only only element in the nib we will attempt to look for is the top level view. It's subviews will be connected as long as the file owner defines all the same outlets, otherwise an exception will occur.
    self.statusView = [topLevelNibObjects lastObject];
}

-(void)presentStatusView{
    if(!self.statusView){
        [self loadStatusView];
    }
    [self.view addSubview:self.statusView];
    [self fillView:self.statusView];
    [self.activityIndicator startAnimating];
}

-(void)dismissStatusView{
    [self.activityIndicator stopAnimating];
    
    [UIView animateWithDuration:.2
                          delay:.1
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.statusView.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                          [self.statusView removeFromSuperview];
                     }];
   
}


- (void)fillView:(UIView*)subview{
    [self fillSubView:subview top:0 leading:0 bottom:0 trailing:0];
}

- (void)fillSubView:(UIView*)subview top:(CGFloat)top leading:(CGFloat)leading bottom:(CGFloat)bottom trailing:(CGFloat)trailing
{
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //receiver must be the superview
    //constraintWithItem: a subview of the superview
    //toItem: the superview
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:top]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:leading]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:bottom]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:trailing]];
    [subview setNeedsLayout];
}


@end
