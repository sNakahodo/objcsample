//
//  ViewController.m
//  rememberme
//
//  Created by 仲程 修平 on 1/16/13.
//  Copyright (c) 2013 仲程 修平. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize whoText, whatText, howMuchText, menuController, scroll, pageControl;

- (void)viewDidLoad
{
    
    self.menuController = [UIMenuController sharedMenuController];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.scroll.delegate = self;
    self.scroll.contentSize = CGSizeMake(900, 100);
    
    UIButton *b1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 10, 200, 100)];
    UIButton *b2 = [[UIButton alloc] initWithFrame:CGRectMake(350, 10, 200, 100)];
    UIButton *b3 = [[UIButton alloc] initWithFrame:CGRectMake(650, 10, 200, 100)];
    
    b1.backgroundColor = [UIColor redColor];
    b2.backgroundColor = [UIColor greenColor];
    b3.backgroundColor = [UIColor blueColor];
    
    
    
    [self.scroll addSubview:b1];
    [self.scroll addSubview:b2];
    [self.scroll addSubview:b3];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scroll.frame.size.width;
    float fractionalPage = self.scroll.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scroll stopped");
}

- (IBAction) afterWhoEdit:(id)sender
{

    [whoText resignFirstResponder];
    [whatText becomeFirstResponder];
    
}

- (IBAction) afterWhatEdit:(id)sender
{
    [whatText resignFirstResponder];
    //[howMuchText becomeFirstResponder];
    
}
- (IBAction)autoComplete:(id)sender {
    
    UITextField *inputText = (UITextField *)sender;

    UIMenuItem *test = [[UIMenuItem alloc] initWithTitle:@"test" action:@selector(caller:)];
    UIMenuItem *damn = [[UIMenuItem alloc] initWithTitle:@"damn" action:@selector(caller:)];
    UIMenuItem *fuck = [[UIMenuItem alloc] initWithTitle:@"fuck" action:@selector(caller:)];
    
    [self.menuController setMenuItems:[NSArray arrayWithObjects:test, damn, fuck, nil]];

    [self.menuController setTargetRect:CGRectMake(inputText.frame.origin.x, inputText.frame.origin.y, 20, 20) inView:self.view];
    [self.menuController setMenuVisible:YES animated:YES];
    
}

-(void)caller:(NSString *)sender {
    
    NSString *v = sender;

    NSLog(@"this is test, %@", v);
}

-(IBAction)onHowMuchEdit:(id)sender{
    [howMuchText resignFirstResponder];
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithFrame:CGRectMake(0, 160, 320, 200)];
    UIDatePicker *dateP = [[UIDatePicker alloc]init];
    dateP.datePickerMode = UIDatePickerModeDate;
    
    howMuchText.inputView = dateP;
    //[sheet becomeFirstResponder];
    //[self.view addSubview:sheet];
}

- (IBAction) afterHowMuchEdit:(id)sender
{
    
    
    /*
    UIDatePicker *dateP = [[UIDatePicker alloc]init];
    dateP.datePickerMode = UIDatePickerModeDate;
    
    [self.view addSubview:dateP];
    */
    
    //this hides keyboard
    //[howMuchText resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
@end
