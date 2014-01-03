//
//  ViewController.m
//  ToolBarTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)handleBarButtonClick:(id)sender;

@end

@implementation ViewController
// 코드로 추가한 리프레쉬 버튼 이벤트 처리
- (void)handleRefresh:(id)sender {
    NSLog(@"Refresh!");
}

// 버튼 이벤트 처리
- (void)handleButton:(id)sender {
    NSLog(@"Button Clicked!");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 코드를 이용해서 툴바 생성
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 160, 320, 60)];
    
    // 문자열 버튼
    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStyleDone target:self action:@selector(handleButton:)];
    
    // 세그먼트 컨트롤 추가
    NSArray *segments = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segments];
//    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    segment.frame = CGRectMake(0, 0, 140, 44);
    UIBarButtonItem *segmentButton = [[UIBarButtonItem alloc] initWithCustomView:segment];
    
    // 공백 추가
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    // 리플레쉬 버튼 추가
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(handleRefresh:)];
    
    NSArray *items = [NSArray arrayWithObjects:titleButton, segmentButton, space, refreshButton, nil];
    [toolbar setItems:items];
    
    [self.view addSubview:toolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleBarButtonClick:(id)sender {
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    if (1 == button.tag) {
        NSLog(@"왼쪽 버튼");
    }
    else {
        NSLog(@"오른쪽 버튼");
    }
}
@end
