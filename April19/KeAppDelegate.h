//
//  KeAppDelegate.h
//  April19
//
//  Created by admin on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer
@class BigView;

@interface KeAppDelegate: UIResponder <UIApplicationDelegate> {
    BigView *bigView;
    UIWindow *_window;
    AVAudioPlayer *player;
}

@property (strong, nonatomic) UIWindow *window;
@end