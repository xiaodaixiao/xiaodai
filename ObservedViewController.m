//
//  ChangeViewController.m
//  KVODemo
//
//  Created by 杨博 on 14-10-22.
//  Copyright (c) 2014年 neworigin. All rights reserved.
//

#import "ObservedViewController.h"

@interface ObservedViewController ()

@end

@implementation ObservedViewController


- (IBAction)back:(id)sender {
	
	//Value的值发送改变
	
	self.stateAppMessage = self.stateMessageTextField.text;
	[self setValue:self.stateAppMessage forKey:@"stateAppMessage"];
}
@end
