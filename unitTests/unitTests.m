//
//  unitTests.m
//  unitTests
//
//  Created by Patrick M on 5/11/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "unitTests.h"
#import "XVimMotionEvaluator.h"
#import "XVimSourceView+Vim.h"
#import "XVimSourceView.h"
#import "XVimWindow.h"
#import "XVimKeyStroke.h"
#import "XVim.h"

#define GET_INSERTION_POINT(x) ([[[((NSTextView*)[[x sourceView] view]) selectedRanges] objectAtIndex:0] rangeValue].location)
#define SET_INSERTION_POINT(x, y) ([((NSTextView*)[[x sourceView] view]) setSelectedRange:NSMakeRange(y,0)])

#pragma mark Start Tests
XVimSourceView *testsourceview;
XVimWindow *testwindow;
NSTextView *txtview;

@implementation unitTests

- (void)setUp{
    [super setUp];
    [XVim initForTesting];
    testwindow = [[XVimWindow alloc] init];
    txtview = [[NSTextView alloc] init];
    testsourceview = [[XVimSourceView alloc] initWithView:txtview];
    ((NSTextView *)[testsourceview view]).string =  @"this is    a test\n    \n\n \n\n\n\n\n";
    [testwindow setSourceView:testsourceview]; 
}

- (void)tearDown{
    [testsourceview release];
    [txtview release];
    [testwindow release];
    [super tearDown];
}
- (void)test_w{
    NSLog(@"testing w");
//    XVimKeyStroke *keystroke = [[XVimKeyStroke alloc] initWithKeyCode:'w' modifierFlags:0];
    NSEvent *keypress = [NSEvent keyEventWithType:NSKeyDown location:NSMakePoint(0,0) modifierFlags:0 timestamp:400030404 windowNumber:0 context:[NSGraphicsContext currentContext] characters:@"w" charactersIgnoringModifiers:@"w" isARepeat:NO keyCode:119];
    
    SET_INSERTION_POINT(testwindow, 0);
//    [testwindow handleKeyEvent:keystroke];
    NSUInteger res = GET_INSERTION_POINT(testwindow);
    NSLog(@"insertionpoint before: %lu", res);
//    [testwindow handleKeyStroke:keystroke];
    [testwindow handleKeyEvent:keypress];
    res = GET_INSERTION_POINT(testwindow);
    NSLog(@"insertionpoint after: %lu", res);
    STAssertNil(nil,@"not nil");
}

//- (void)test_E{
//    NSLog(@"testing E");
//    NSLog(@"string is: %@", [testsourceview string]);
//    XVimWordInfo info;
//    info.findEndOfWord = TRUE;
//    NSUInteger to = 0; 
//    NSUInteger oldto = 0; 
//    NSString* word;
//    while (true){
//        to = [testsourceview wordsForward:to count:1 option:MOTION_OPTION_NONE info:&info];
//        NSLog(@"to: %lu", to);
//        if (to >= [[testsourceview string] length]) {
//            break;
//        }
//        NSLog(@"range (%lu, %lu)", oldto, to);
//        word = [[[testsourceview string] substringWithRange:NSMakeRange(oldto, info.lastEndOfWord-oldto+1)] stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
//        NSLog(@"last word found: \"%@\"", word);
//        if(to == oldto) break;
//        oldto = to;
//    }
//
//    [testsourceview release];
//    testsourceview = nil;
//    STAssertNil(testsourceview, @"testsourceview not nil");
//}
//
//- (void)test_e{
//    NSLog(@"testing E");
//    NSLog(@"string is: %@", [testsourceview string]);
//    XVimWordInfo info;
//    info.findEndOfWord = TRUE;
//    NSUInteger to = [testsourceview wordsForward:0 count:5 option:MOTION_OPTION_NONE info:&info];
//    NSLog(@"to is %lu", to);
//    NSLog(@"info.lastendofword is %lu", info.lastEndOfWord);
//    STAssertTrue(TRUE, @"it is true");
//    [testsourceview release];
//    testsourceview = nil;
//    STAssertNil(testsourceview, @"testsourceview not nil");
//}

@end
