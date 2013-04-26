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
@synthesize whoText, whatText, howMuchText, menuController;

- (void)viewDidLoad
{
    
    self.menuController = [UIMenuController sharedMenuController];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
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

@end
