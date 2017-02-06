//
//  ViewController3.m
//  TopVC
//
//  Created by 张尉 on 2017/2/6.
//  Copyright © 2017年 wayne. All rights reserved.
//

#import "ViewController3.h"
#import "TopVC.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"self is %@, top is %@", self, [TopVC shared].top);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
    [super touchesEnded:touches withEvent:event];
}


@end
