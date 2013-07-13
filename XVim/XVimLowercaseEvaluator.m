//
//  XVimLowercaseEvaluator.m
//  XVim
//
//  Created by Tomas Lundell on 6/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimLowercaseEvaluator.h"
#import "XVimSourceView.h"
#import "XVimSourceView+Vim.h"
#import "XVimWindow.h"
#import "XVim.h"

@implementation XVimLowercaseEvaluator

- (XVimEvaluator*)u{
    if ([self numericArg] < 1) 
        return nil;
    
    XVimMotion* m = XVIM_MAKE_MOTION(MOTION_LINE_FORWARD, LINEWISE, MOTION_OPTION_NONE, [self numericArg]-1);
    return [self _motionFixed:m];
}

-(XVimEvaluator*)motionFixed:(XVimMotion*)motion{
    [[self sourceView] makeLowerCase:motion];
    [[XVim instance] fixRepeatCommand];
    return nil;
}


@end

