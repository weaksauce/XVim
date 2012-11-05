//
//  XVimHookManager.m
//  XVim
//
//  Created by Tomas Lundell on 29/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimHookManager.h"
#import "IDEEditorAreaHook.h"
#import "DVTSourceTextViewHook.h"
#import "IDESourceCodeEditorHook.h"
#import "DVTSourceTextScrollViewHook.h"
#import "IDEEditorHook.h"

@implementation XVimHookManager

+ (void)hookWhenPluginLoaded
{
    [IDEEditorAreaHook hook];
}

+ (void)hookWhenDidFinishLaunching
{
	[DVTSourceTextViewHook hook];
	[IDESourceCodeEditorHook hook];
    //[DVTSourceTextScrollViewHook hook];
    [IDEEditorHook hook];
//    IDEApplicationController * appdel = [IDEApplicationController sharedAppController];
    // NSLog(@"Appcontroller is %@", appdel);
    //NSLog(@"%@", [appdel->_windowController class]);
//    [appdel accessInternalVariable];
    //[Logger traceIvarList:@"IDEApplicationController"];
//    NSLog(@"appdel->windowcontroller %@", [appdel valueForKey:@"_windowController"]);
//    NSLog(@"file menu: %@", [appdel _fileMenu]);
    NSMenu* main = [NSApp mainMenu];
    
    NSLog(@"main menu: %@", main);
    NSMenu* xvimMenu = [[NSMenu alloc] initWithTitle:@"XVim"];
    NSMenuItem *xvimMenuitem = [[NSMenuItem alloc] initWithTitle:@"XVim" action:nil keyEquivalent:@"x"];
    [main addItem:xvimMenuitem];
    [main setSubmenu:xvimMenu forItem:xvimMenuitem];
    NSLog(@"main menu: %@", main);
}

@end
