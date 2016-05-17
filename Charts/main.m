//
//  main.m
//  Charts
//
//  Created by chengxun on 16/5/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
__attribute__((constructor))
static void beforeMain(void){
    NSLog(@"beforeMain");
}
__attribute__((destructor))
static void afterMain(void){
    NSLog(@"afterMain");
}
int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"main");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
