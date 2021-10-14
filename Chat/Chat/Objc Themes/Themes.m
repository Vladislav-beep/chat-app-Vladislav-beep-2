//
//  Themes.m
//  Chat
//
//  Created by Владислав Сизонов on 10.10.2021.
//

#import "Themes.h"

@implementation Themes

@synthesize theme1 = _theme1;
@synthesize theme2 = _theme2;
@synthesize theme3 = _theme3;

- (UIColor *) theme1 {
    return _theme1;
}

- (UIColor *) theme2 {
    return _theme2;
}

- (UIColor *) theme3 {
    return _theme3;
}

-(id) init {
    self = [super init];
    if (self = [super init]) {
    _theme1 = [[UIColor redColor] retain];
    _theme2 = [[UIColor yellowColor] retain];
    _theme3 = [[UIColor greenColor] retain];
}

    return self;
}

- (void)dealloc {
    [_theme1 release];
    [_theme2 release];
    [_theme3 release];
   
    [super dealloc];
}

@end
