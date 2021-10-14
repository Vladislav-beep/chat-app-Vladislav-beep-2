//
//  ThemesViewController.h
//  Chat
//
//  Created by Владислав Сизонов on 10.10.2021.
//

#import <UIKit/UIKit.h>
#import "Themes.h"
#import "ThemesViewControllerDelegate.h"


NS_ASSUME_NONNULL_BEGIN


@interface ThemesViewController : UIViewController <ThemesViewControllerDelegateProtocol> {

Themes *model;
}

@property (weak, nonatomic) id<ThemesViewControllerDelegateProtocol> delegate;

@end


NS_ASSUME_NONNULL_END
