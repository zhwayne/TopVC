//
//  TopVC.m
//  TopVC
//
//  Created by 张尉 on 2017/2/6.
//  Copyright © 2017年 wayne. All rights reserved.
//

#import "TopVC.h"
#import <objc/runtime.h>

#define swizzing(before, after) do {                                                                              \
static dispatch_once_t onceToken;                                               \
dispatch_once(&onceToken, ^{                                                    \
Class class = [self class];                                                 \
\
SEL beforSelector = NSSelectorFromString(before);                           \
SEL afterSelector = NSSelectorFromString(after);                            \
\
Method beforMethod = class_getInstanceMethod(class, beforSelector);         \
Method afterMethod = class_getInstanceMethod(class, afterSelector);         \
\
BOOL didAddMethod = class_addMethod(class,                                  \
beforSelector,                          \
method_getImplementation(afterMethod),  \
method_getTypeEncoding(afterMethod));   \
\
if (didAddMethod) {                                                         \
class_replaceMethod(class,                                              \
beforSelector,                                      \
method_getImplementation(beforMethod),              \
method_getTypeEncoding(beforMethod));               \
}                                                                           \
else {                                                                      \
method_exchangeImplementations(beforMethod, afterMethod);               \
}                                                                           \
});                                                                             \
} while (0)                                                                         \




@interface TopVC ()

@property (weak, readwrite) UIViewController *top;

@end

@implementation TopVC

+ (instancetype)shared {
    static TopVC *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


@end


@implementation UIViewController (TopVCSupport)

@dynamic tv_ignoreSelf;


- (BOOL)tv_ignoreSelf {
    id res = objc_getAssociatedObject(self, "tv_ignoreSelf");
    return res != nil ? [res boolValue] : NO;
}

- (void)setTv_ignoreSelf:(BOOL)tv_ignoreSelf {
    objc_setAssociatedObject(self, "tv_ignoreSelf", @(tv_ignoreSelf), OBJC_ASSOCIATION_ASSIGN);
}

+ (void)load {
    @autoreleasepool {
        swizzing(@"viewDidAppear:", @"vcs_viewDidAppear:");
    }
}


- (void)vcs_viewDidAppear:(BOOL)animated {
    if (self.tv_ignoreSelf == NO) {
        [TopVC shared].top = self;
    }
    [self vcs_viewDidAppear:animated];
}
@end

#undef swizzing
