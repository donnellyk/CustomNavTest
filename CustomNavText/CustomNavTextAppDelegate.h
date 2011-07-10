//
//  CustomNavTextAppDelegate.h
//  CustomNavText
//
//  Created by Kevin Donnelly on 7/8/11.
//

#import <UIKit/UIKit.h>

@interface CustomNavTextAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
