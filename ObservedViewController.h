//
//  ChangeViewController.h
//  KVODemo
//
//  Created by 杨博 on 14-10-22.
//  Copyright (c) 2014年 neworigin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObservedViewController : UIViewController
@property (strong, nonatomic) NSString * stateAppMessage;
@property (weak, nonatomic) IBOutlet UITextField *stateMessageTextField;

- (IBAction)back:(id)sender;

@end
