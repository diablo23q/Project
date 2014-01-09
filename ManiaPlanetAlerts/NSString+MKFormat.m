//
//  NSString+MKFormat.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/9/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "NSString+MKFormat.h"

@implementation NSString (MKFormat)

+(NSUInteger)unicharToInt:(unichar) c
{
    if (c >= '0' && c <= '9') {
        return c - '0';
    }
    if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    }
    if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    }
    return 0;
}

-(NSAttributedString*)colorizeManiaString
{
    NSUInteger i = 0;
    NSInteger begin = 0, end = 0;
    UIColor *col;
    UIFont *fnt, *norm, *bld, *it;
    norm = [UIFont systemFontOfSize:        [UIFont systemFontSize]];
    bld  = [UIFont boldSystemFontOfSize:    [UIFont systemFontSize]];
    it   = [UIFont italicSystemFontOfSize:  [UIFont systemFontSize]];
    fnt = norm;
    BOOL color = FALSE, cap = FALSE;
    NSMutableAttributedString *res = [[NSMutableAttributedString alloc] initWithString:@""];
    while(i < self.length) {
        NSInteger remain = self.length - i - 1;
        unichar c = [self characterAtIndex:i];
        if (c == '$' && remain > 0) {
            end = i-1;
            if (end >= begin) {
                NSString *tmp = [[self substringFromIndex:begin] substringToIndex:end-begin+1];
                if (cap) {
                    tmp = [tmp capitalizedString];
                }
                NSMutableDictionary *attr = [[NSMutableDictionary alloc] initWithDictionary:@{NSFontAttributeName:fnt}];
                if (color) {
                    [attr addEntriesFromDictionary: @{NSForegroundColorAttributeName:col}];
                }
                [res appendAttributedString:[[NSAttributedString alloc] initWithString:tmp attributes:attr]];
            }
            unichar cn = [self characterAtIndex:i+1];
            if (((cn >= '0' && cn <= '9') ||
                 (cn >= 'a' && cn <= 'f') ||
                 (cn >= 'A' && cn <= 'F')) && remain > 2) {
                NSUInteger r = [NSString unicharToInt:cn];
                NSUInteger g = [NSString unicharToInt:[self characterAtIndex:i+2]];
                NSUInteger b = [NSString unicharToInt:[self characterAtIndex:i+3]];
                col = [UIColor colorWithRed:r/15.0 green:g/15.0 blue:b/15.0 alpha:1.0];
                color = TRUE;
                i += 4;
                begin = i;
            } else if (cn == 'g' || cn == 'G') {
                color = FALSE;
                i += 2;
                begin = i;
            } else if (cn == 't' || cn == 'T') {
                cap = TRUE;
                i += 2;
                begin = i;
            } else if (cn == 'i' || cn == 'I') {
                fnt = it;
                i += 2;
                begin = i;
            } else if (cn == 'm' || cn == 'M') {
                fnt = norm;
                i += 2;
                begin = i;
            } else if (cn == 'o' || cn == 'O') {
                fnt = bld;
                i += 2;
                begin = i;
            } else if (cn == 'z' || cn == 'Z') {
                fnt = norm;
                color = FALSE;
                cap = FALSE;
                i += 2;
                begin = i;
            } else if (cn == 's' || cn == 'S' ||
                       cn == 'w' || cn == 'W' ||
                       cn == 'n' || cn == 'N') {
                i += 2;
                begin = i;
            } else if (cn == '$') {
                i += 2;
                begin = i-1;;
            } else {
                i++;
                begin = i-1;;
            }
        } else {
            i++;
        }
    }
    NSString *tmp = [self substringFromIndex:begin];
    if (cap) {
        tmp = [tmp capitalizedString];
    }
    NSMutableDictionary *attr = [[NSMutableDictionary alloc] initWithDictionary:@{NSFontAttributeName:fnt}];
    if (color) {
        [attr addEntriesFromDictionary: @{NSForegroundColorAttributeName:col}];
    }
    [res appendAttributedString:[[NSAttributedString alloc] initWithString:tmp attributes:attr]];
    return res;
}

@end
