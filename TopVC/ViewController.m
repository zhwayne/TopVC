//
//  ViewController.m
//  TopVC
//
//  Created by 张尉 on 2017/2/6.
//  Copyright © 2017年 wayne. All rights reserved.
//

#import "ViewController.h"
#import "TopVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"self is %@, top is %@", self, [TopVC shared].top);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[self class] new] animated:YES];
    [super touchesEnded:touches withEvent:event];
}


@end
