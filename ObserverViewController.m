//
//  ViewController.m
//  KVODemo
//
//  Created by 杨博 on 14-10-22.
//  Copyright (c) 2014年 neworigin. All rights reserved.
//

#import "ObserverViewController.h"
#import "ObservedViewController.h"

@interface ObserverViewController ()

@end

@implementation ObserverViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.stateAppMessage = @"ViewController";
	self.stateMessageLabel.text = self.stateAppMessage;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)Go:(id)sender {
	UIStoryboard * storyboard =	[UIStoryboard storyboardWithName:@"Main" bundle:nil];
	self.changeVC = [storyboard instantiateViewControllerWithIdentifier:@"ObservedViewController"];
	
	/*
	 * 通过此消息注册观察者
	 * - (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
	 * addObserver: 要被观察的对象
	 * forKeyPath: 被关注对象的属性
	 * options: 为属性变化设置的选项“NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld”意味着把属性新旧两个值都传递给观察者
	 * context: 上下文内容，类型为（void *）C语言形式的通用指针，如果传递的是“空”，应该是NULL
	 */
	
	//self.changeVC : Observed
	//self: Observer
	[self.changeVC addObserver:self forKeyPath:@"stateAppMessage" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"Pass Contxt"];
	[self presentViewController:self.changeVC animated:YES completion:^{
	}];
}

/*
 * 当对象属性变化时，观察者就会接收到通知，观察者需要重写“NSKeyValueObserving”类的方法，以响应观察者属性的变化
 * observeValueForKeyPath: 是被关注的属性
 * ofObject: 是被关注的对象
 * change: 是字典类型 （包含了属性变化的内容，这些内容与注册时属性变化设置的选项options参数有关）
 * context: 注册时传递的上下文内容
 */
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	if ([keyPath isEqualToString:@"stateAppMessage"]) {
		NSLog(@"Property '%@' of object '%@' changed: %@ context: %@",keyPath,object,change,context);
		self.stateAppMessage = [change objectForKey:@"new"];
		self.stateMessageLabel.text = self.stateAppMessage;
		
		//实现模态消失功能
		[self dismissViewControllerAnimated:YES completion:nil];
		
		//移除观察者
		[self.changeVC removeObserver:self forKeyPath:@"stateAppMessage"];
	}
}
@end
