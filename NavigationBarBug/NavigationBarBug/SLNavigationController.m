//
//  SLNavigationController.m
//  NavigationBarBug
//
//  Created by songlin on 2016/12/19.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "SLNavigationController.h"
#import "Macro.h"

@interface SLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置代理
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#if !ShowBug
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.visibleViewController;
}
#endif





@end
