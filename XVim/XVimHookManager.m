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
#import "XVim.h"
#define toggleXVimMenuitemTag 345623

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
    NSMenu* main = [NSApp mainMenu];
    
    NSMenu* xvimMenu = [[NSMenu alloc] initWithTitle:@"XVim"];
    NSMenuItem *xvimMenuitem = [[NSMenuItem alloc] initWithTitle:@"XVim" action:nil keyEquivalent:@""];
    [xvimMenuitem setSubmenu:xvimMenu];
    [main addItem:xvimMenuitem];
    [xvimMenu release];
    [xvimMenuitem release];
    
    xvimMenuitem = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"Toggle XVim on/off" action:NULL keyEquivalent:@""];
    [xvimMenuitem setTag:toggleXVimMenuitemTag];
    [xvimMenuitem setTarget:[XVim instance]];
    [xvimMenuitem setAction:@selector(toggleXVim:)];
    [xvimMenu addItem:xvimMenuitem];
    [xvimMenuitem release];
//    [main setSubmenu:xvimMenu forItem:xvimMenuitem];
}

@end
