//
//  ThemesViewController.m
//  Chat
//
//  Created by Владислав Сизонов on 10.10.2021.
//
#import <UIKit/UIKit.h>
#import "ThemesViewController.h"
//#import "ThemesViewControllerDelegate.h"


@implementation ThemesViewController

- (IBAction)themeOneButtonPressed:(UIButton *)sender {
    UIColor *colour = model.theme1;
    self.view.backgroundColor = colour;
    
    [self.delegate themesViewController:self didSelectTheme:colour];
}

- (IBAction)themeTwoButtonPresssed:(UIButton *)sender {
    UIColor *colour = model.theme2;
    self.view.backgroundColor = colour;
   
    [self.delegate themesViewController:self didSelectTheme:colour];
}

- (IBAction)themeThreeButtonPressed:(UIButton *)sender {
    UIColor *colour = model.theme3;
    self.view.backgroundColor = colour;
    
    [self.delegate themesViewController:self didSelectTheme:colour];
}

- (IBAction)closeButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    model = [Themes new];
}

- (void)themesViewController: (ThemesViewController *)controller
              didSelectTheme:(UIColor *)selectedTheme {}

- (void)dealloc {
    [model release];
    [super dealloc];
}

@end
