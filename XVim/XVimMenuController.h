//
//  XVimMenuController.h
//  XVim
//
//  Created by Patrick on 11/4/12.
//
//

#import <Foundation/Foundation.h>

@interface XVimMenuController : NSObject<NSMenuDelegate>
-(id) initWithMenus;
//-(BOOL) validateMenuItem:(NSMenuItem *)menuItem;
-(void) addMenu;
@end
