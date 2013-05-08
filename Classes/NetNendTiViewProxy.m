/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "NetNendTiViewProxy.h"
#import "NetNendTiView.h"
#import "TiUtils.h"

@implementation NetNendTiViewProxy

-(void)pause:(id)args
{
    TiThreadPerformOnMainThread(^{[self pause];}, NO);
}

-(void)resume:(id)args
{
    TiThreadPerformOnMainThread(^{[self resume];}, NO);
}

@end
