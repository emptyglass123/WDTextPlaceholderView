# WDTextPlaceholderView
# 带水印的UITextView 自定义UITextView 
# egzample

    WDTextPlaceholderView *text = [[WDTextPlaceholderView alloc] initWithFrame:CGRectMake(20, 120, 300, 200)];
    [self.view addSubview:text];
    text.backgroundColor = [UIColor whiteColor];
    text.placeholder = @"请输入...";
    text.placeholderColor = [UIColor lightGrayColor];
    text.indentOfY = 7.0;        // 垂直缩进
    text.indentOfX = 7.0;       // 水平缩进
    text.openPlaceHolder = YES; // 打开水印 默认 YES
    text.openRoundView = YES;   // 打开圆角 默认 NO
