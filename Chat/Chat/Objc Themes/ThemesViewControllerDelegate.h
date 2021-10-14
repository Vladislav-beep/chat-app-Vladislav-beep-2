//
//  ThemesViewControllerDelegate.h
//  Chat
//
//  Created by Владислав Сизонов on 10.10.2021.
//

#import <UIKit/UIKit.h>

@class ThemesViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol ThemesViewControllerDelegateProtocol <NSObject>

- (void)themesViewController: (ThemesViewController *)controller
               didSelectTheme:(UIColor *)selectedTheme;

@end



NS_ASSUME_NONNULL_END
