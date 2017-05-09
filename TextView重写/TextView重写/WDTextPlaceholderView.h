//
//  WDTextPlaceholderView.h
//  TextView重写
//
//  Created by 朱辉 on 2017/5/9.
//  Copyright © 2017年 WD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDTextPlaceholderView : UITextView


//水印文字
@property (nonatomic, strong) NSString *placeholder ;

//水印文字颜色
@property (nonatomic, strong) UIColor *placeholderColor ;

//开启水印
@property (nonatomic, assign) BOOL openPlaceHolder ;

//开启圆角
@property (nonatomic, assign) BOOL openRoundView ;

//水印缩进 X
@property (nonatomic, assign) CGFloat indentOfX ;

//水印缩进 Y
@property (nonatomic, assign) CGFloat indentOfY ;


@end
