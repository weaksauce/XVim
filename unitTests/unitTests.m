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

#pragma mark XVimSourceViewTest
@interface XVimSourceViewTest:XVimSourceView
@end
@implementation XVimSourceViewTest:XVimSourceView
-(NSString*) string{
    //TODO: load strings to test from a file or files
    return @"this is    a test\n    \n\n \n\n\n\n\n";
}
@end

#pragma mark Start Tests
XVimSourceViewTest *testsourceview;
@implementation unitTests

- (void)setUp{
    [super setUp];
    testsourceview = [[XVimSourceViewTest alloc] initWithView:nil];
}

- (void)tearDown{
    [testsourceview release];
    [super tearDown];
}
- (void)test_w{
    NSLog(@"string is: %@", [testsourceview string]);
    XVimWordInfo info;
    NSUInteger to = 0, oldto = 0; 
    NSString* word;
    while (true){
        to = [testsourceview wordsForward:to count:1 option:MOTION_OPTION_NONE info:&info];
        NSLog(@"to: %lu", to);
        if (to >= [[testsourceview string] length]) {
            break;
        }
        NSLog(@"range (%lu, %lu)", oldto, to);
        word = [[[testsourceview string] substringWithRange:NSMakeRange(oldto, info.lastEndOfWord-oldto+1)] stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
        NSLog(@"last word found: \"%@\"", word);
        if(to == oldto) break;
        oldto = to;
    }

    [testsourceview release];
    testsourceview = nil;
    STAssertNil(testsourceview, @"testsourceview not nil");
}

- (void)test_E{
    NSLog(@"string is: %@", [testsourceview string]);
    XVimWordInfo info;
//    info.findEndOfWord = TRUE;
    NSUInteger to = 0; 
    NSUInteger oldto = 0; 
    NSString* word;
    while (true){
        to = [testsourceview wordsForward:to count:1 option:MOTION_OPTION_NONE info:&info];
        NSLog(@"to: %lu", to);
        if (to >= [[testsourceview string] length]) {
            break;
        }
        NSLog(@"range (%lu, %lu)", oldto, to);
        word = [[[testsourceview string] substringWithRange:NSMakeRange(oldto, info.lastEndOfWord-oldto+1)] stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
        NSLog(@"last word found: \"%@\"", word);
        if(to == oldto) break;
        oldto = to;
    }

    [testsourceview release];
    testsourceview = nil;
    STAssertNil(testsourceview, @"testsourceview not nil");
}

- (void)test_e{
    NSLog(@"string is: %@", [testsourceview string]);
    XVimWordInfo info;
    info.findEndOfWord = TRUE;
    NSUInteger to = [testsourceview wordsForward:0 count:5 option:MOTION_OPTION_NONE info:&info];
    NSLog(@"to is %lu", to);
    NSLog(@"info.lastendofword is %lu", info.lastEndOfWord);
    STAssertTrue(TRUE, @"it is true");
    [testsourceview release];
    testsourceview = nil;
    STAssertNil(testsourceview, @"testsourceview not nil");
}

@end
