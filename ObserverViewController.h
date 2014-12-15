//
//  ViewController.h
//  KVODemo
//
//  Created by 杨博 on 14-10-22.
//  Copyright (c) 2014年 neworigin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ObservedViewController;
@interface ObserverViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *stateMessageLabel;
@property (strong, nonatomic) NSString * stateAppMessage;
@property (strong, nonatomic)ObservedViewController * changeVC;
- (IBAction)Go:(id)sender;

@end

