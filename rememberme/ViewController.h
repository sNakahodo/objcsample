//
//  ViewController.h
//  rememberme
//
//  Created by 仲程 修平 on 1/16/13.
//  Copyright (c) 2013 仲程 修平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    /*
    IBOutlet UITextField *whoText;
    IBOutlet UITextField *whatText;
     */
}
@property (retain, nonatomic) IBOutlet UITextField *whoText;
@property (retain, nonatomic) IBOutlet UITextField *whatText;
@property (retain, nonatomic) IBOutlet UITextField *howMuchText;
@property (retain, nonatomic) UIMenuController *menuController;
-(IBAction) afterWhoEdit:(id)sender;
-(IBAction) afterWhatEdit:(id)sender;
-(IBAction) afterHowMuchEdit:(id)sender;

@end