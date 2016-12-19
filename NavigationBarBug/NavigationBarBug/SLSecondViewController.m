//
//  SLSecondViewController.m
//  NavigationBarBug
//
//  Created by songlin on 2016/12/19.
//  Copyright © 2016年 songlin. All rights reserved.
//

#import "SLSecondViewController.h"

@interface SLSecondViewController ()

@end

@implementation SLSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end
