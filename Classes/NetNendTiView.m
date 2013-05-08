/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "NetNendTiView.h"
#import "TiApp.h"

@implementation NetNendTiView

-(void)refreshAd:(CGRect)bounds
{
    if (ad != nil)
    {
        [ad removeFromSuperview];
        RELEASE_TO_NIL(ad);
    }
    
    ad = [[NADView alloc] initWithFrame:bounds];
    
    [ad setNendID:[self.proxy valueForKey:@"nendId"] spotID:[self.proxy valueForKey:@"spotId"]];
    [ad setDelegate:self];
    [ad setRootViewController:[[TiApp app] controller]];
    if ([self.proxy valueForKey:@"retry"] != nil)
    {
        [ad load:[NSDictionary dictionaryWithObjectsAndKeys:[self.proxy valueForKey:@"retry"], @"retry", nil]];
    } else {
        [ad load];
    }
    [self addSubview:ad];
    
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    [self refreshAd:bounds];
}

-(void)dealloc
{
    if (ad != nil) {
        [ad removeFromSuperview];
        RELEASE_TO_NIL(ad);
    }
    [super dealloc];
}

-(void)nadViewDidFinishLoad:(NADView *)view
{
    NSLog(@"[DEBUG] delegate nadViewDidFinishLoad:");
    
    if ([self.proxy _hasListeners:@"load"])
    {
        [self.proxy fireEvent:@"load"];
    }
}

-(void)nadViewDidReceiveAd:(NADView *)view
{
    NSLog(@"[DEBUG] delegate nadViewDidReceiveAd:");
    
    if ([self.proxy _hasListeners:@"receive"])
    {
        [self.proxy fireEvent:@"receive"];
    }
}

-(void)nadViewDidFailToReceiveAd:(NADView *)view
{
    NSLog(@"[DEBUG] delegate nadViewDidFailToLoad:");
    
    if ([self.proxy _hasListeners:@"error"])
    {
        [self.proxy fireEvent:@"error"];
    }
}

-(void)pause
{
    [ad pause];
}

-(void)resume
{
    [ad resume];
}

@end
