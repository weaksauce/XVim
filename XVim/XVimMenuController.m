//
//  XVimMenuController.m
//  XVim
//
//  Created by Patrick on 11/4/12.
//
//
#define toggleXVimMenuitemTag 344532

#import "XVimMenuController.h"
#import "XVim.h"
#import "XVimOptions.h"

//static XVimMenuController* s_instance = nil;

// The purpose of this class is to programmatically add menu items to the existing structure of the Xcode IDE. 
@implementation XVimMenuController

-(id) initWithMenus{
    if([super init]){
        [self addMenu];
    }
    return self;
}

-(void) addMenu{
//    [[NSApp mainMenu] setDelegate:self];
    NSMenu* xvimMenu = [[NSMenu allocWithZone:[NSMenu menuZone]] initWithTitle:@"XVim"];
    [xvimMenu setDelegate:self];
    [xvimMenu setMenuChangedMessagesEnabled:YES];
    NSMenuItem *xvimMenuitem = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"XVim" action:nil keyEquivalent:@""];
    [xvimMenuitem setSubmenu:xvimMenu];
    [[NSApp mainMenu] addItem:xvimMenuitem];
    
    [xvimMenu release];
    [xvimMenuitem release];
    
    // handle the toggle XVim menu.
    xvimMenuitem = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"Toggle XVim on/off" action:NULL keyEquivalent:@""];
    [xvimMenuitem setTag:toggleXVimMenuitemTag];
    [xvimMenuitem setTarget:[XVim instance]];
    [xvimMenuitem setAction:@selector(toggleXVim:)];
    [xvimMenuitem setOnStateImage:[NSImage imageNamed:@"NSMenuCheckmark"]];
    
    [xvimMenu addItem:xvimMenuitem];
    [xvimMenuitem release];
}

//- (BOOL)validateMenuItem:(NSMenuItem *)menuItem{
//    
//    NSInteger tag = [menuItem tag];
//    NSLog(@"inside validate menuitem");
//    if(tag == toggleXVimMenuitemTag){
//        //[[XVim instance] toggleXVim:nil];
//        XVimOptions* opt = [[XVim instance] options];
//        if(opt.enabled){
//            [menuItem setState:NSOnState];
//            NSLog(@"xvimEnabled");
//        }else{
//            [menuItem setState:NSOffState];
//            NSLog(@"xvimDisabled");
//        }
//    }
//    return YES;
//    
//}
@end

