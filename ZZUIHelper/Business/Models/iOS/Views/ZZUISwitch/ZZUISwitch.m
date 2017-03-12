
//
//  ZZUISwitch.m
//  ZZUIHelper
//
//  Created by 李伯坤 on 2017/2/20.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "ZZUISwitch.h"

@implementation ZZUISwitch
@synthesize events = _events;
@synthesize properties = _properties;

- (NSMutableArray *)properties
{
    if (!_properties) {
        _properties = [super properties];
        
        ZZProperty *on = [[ZZProperty alloc] initWithPropertyName:@"on" type:ZZPropertyTypeBOOL defaultValue:@(YES)];
        ZZProperty *onImage = [[ZZProperty alloc] initWithPropertyName:@"onImage" type:ZZPropertyTypeObject defaultValue:@""];
        [onImage setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setOnImage:[UIImage imageNamed:@\"%@\"]",  value];
        }];
        ZZProperty *offImage = [[ZZProperty alloc] initWithPropertyName:@"offImage" type:ZZPropertyTypeObject defaultValue:@""];
        [offImage setPropertyCodeByValue:^NSString *(id value) {
            return [NSString stringWithFormat:@"setOffImage:[UIImage imageNamed:@\"%@\"]",  value];
        }];
        ZZPropertyGroup *group = [[ZZPropertyGroup alloc] initWithGroupName:@"UISwitch" properties:@[on, onImage, offImage]];
        [_properties addObject:group];
    }
    return _properties;
}

- (NSArray *)events
{
    if (!_events) {
        ZZEvent *valueChanged = [[ZZEvent alloc] initWithEventType:@"UIControlEventValueChanged" selected:YES];
        _events = @[valueChanged];
    }
    return _events;
}

@end
