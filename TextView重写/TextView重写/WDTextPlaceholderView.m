//
//  WDTextPlaceholderView.m
//  TextView重写
//
//  Created by 朱辉 on 2017/5/9.
//  Copyright © 2017年 WD. All rights reserved.
//

#import "WDTextPlaceholderView.h"

@interface WDTextPlaceholderView ()
// 水印 UILable
@property (nonatomic, strong) UILabel *placeholderLable;
@property (nonatomic, assign) CGFloat defaultFont;

@end
@implementation WDTextPlaceholderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildViews];
    }
    return self;
}
-(void)buildViews
{
    _defaultFont = 16.0; _indentOfX = 7.0; _indentOfY = 7.0;
    _openPlaceHolder = YES; _openRoundView = NO;
    self.placeholderColor = [UIColor lightGrayColor];
    self.font = [UIFont systemFontOfSize:_defaultFont];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WDTextViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    
}

- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    if (_openRoundView) {
        
        self.layer.cornerRadius = 4.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.masksToBounds = YES;
    }

    
    if (!_openPlaceHolder) {
    
        return;
    }
    if (!_placeholder||[_placeholder isEqualToString:@""]) {
        return;
    }

    if ([self needShowPlaceHolder]) {
        _placeholderLable.textColor = _placeholderColor;
        _placeholderLable.hidden = NO;
        [self sendSubviewToBack:_placeholderLable];
    }
}

-(BOOL)needShowPlaceHolder
{
    if (_placeholderLable.hidden && self.placeholder.length > 0 && self.text.length == 0) {
        return YES;
    }
    return NO;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect rect = CGRectMake(_indentOfX, _indentOfY, self.width - _indentOfX + 2.0, 18.0 /*font 值不同会影响Y方向缩进效果,可调整...*/);
    _placeholderLable.frame = rect;
    
}
-(UILabel *)placeholderLable
{
    if (!_placeholder) {
        return nil;
    }
    
    if (!_placeholderLable) {
        
        _placeholderLable = [[UILabel alloc] init];
        _placeholderLable = [[UILabel alloc] init];
        _placeholderLable.lineBreakMode = NSLineBreakByWordWrapping;
        _placeholderLable.numberOfLines = 1;
        _placeholderLable.font = self.font;
        _placeholderLable.backgroundColor = [UIColor clearColor];
        _placeholderLable.textColor = self.placeholderColor;
        _placeholderLable.textAlignment = NSTextAlignmentLeft;
        _placeholderLable.hidden = YES;
        
        [self addSubview:_placeholderLable];
    }
    return _placeholderLable;

}
-(void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];

    [self  WDTextViewDidChange:nil];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    if ([placeholder isEqualToString:_placeholder]) {
        return;
    }
    _placeholder = placeholder;
    self.placeholderLable.text = placeholder;
    [self setNeedsDisplay];

}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLable.font = font;
    [self setNeedsDisplay];

}
-(void)WDTextViewDidChange:(NSNotification *)notification
{
    if (self.placeholder.length == 0) {
        
        return;
    }
    
    _placeholderLable.hidden = (self.text.length > 0)? YES:NO;
    
}

- (CGFloat)width
{
    return self.frame.size.width;
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_placeholderLable removeFromSuperview];
    _placeholderLable.text = nil;
    _placeholder = nil;
  
}
@end
