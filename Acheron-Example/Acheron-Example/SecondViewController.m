//
//  SecondViewController.m
//  Acheron-Example
//
//  Created by YANKE Guo on 14-5-4.
//  Copyright (c) 2014年 YANKE Guo. All rights reserved.
//

#import "SecondViewController.h"
#import "NIBBindingScrollView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.view addSubview:[NIBBindingScrollView new]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
