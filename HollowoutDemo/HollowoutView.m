//
//  HollowoutView.m
//  HollowoutDemo
//
//  Created by liuwei on 16/9/19.
//  Copyright © 2016年 liuwei. All rights reserved.
//

#import "HollowoutView.h"

@interface HollowoutView ()

@property (nonatomic, strong) UIColor *bgColor;

@end

@implementation HollowoutView

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _text = text;
    }
    
    return self;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.bgColor = backgroundColor;
    [super setBackgroundColor:[UIColor clearColor]];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.bgColor setFill];
    
    CGContextAddRect(context, rect);
    
    [self drawSubtractedText:_text inRect:rect inContext:context];
    
}

- (void)drawSubtractedText:(NSString *)text inRect:(CGRect)rect
                 inContext:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
        
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(rect), CGRectGetHeight(rect));
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = _font;
    label.text = text;
    label.textAlignment = _textAlignment;
    label.backgroundColor = self.bgColor;
    [label.layer drawInContext:context];
    
    CGContextRestoreGState(context);
}


@end
