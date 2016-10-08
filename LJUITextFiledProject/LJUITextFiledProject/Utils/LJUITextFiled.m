//
//  NTUITextFiled.m
//  YiHeUser
//
//  Created by liu jing on 16/8/18.
//  Copyright © 2016年 liu jing. All rights reserved.
//

#import "LJUITextFiled.h"
#import "Utils.h"
@interface LJUITextFiled ()<UITextFieldDelegate>
{
    
    UIView *errorAlertView;
}
// UI视图
@property (nullable, strong, nonatomic) UIImageView  *rightImageView;
@end
@implementation LJUITextFiled

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.iSSuccess = NO;
        // 监听文本框改变时的事件
       [self addTarget:self action:@selector(textFiledEditChanged:) forControlEvents:UIControlEventEditingChanged];
        // 监听结束时的事件
       [self addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
        // 监听开始时的事件
       [self addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
        self.rightImageView = [[UIImageView alloc] init];
        self.rightImageView.frame = CGRectMake(self.frame.size.width-40, (self.frame.size.height-20)/2, 20, 20);
        self.rightImageView.image = [UIImage imageNamed:@"img122.png"];
        self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.rightImageView];
        self.delegate = self;
    }
    return self;
}
#pragma mark 监听事件 文本框内容改变时
-(void)textFiledEditChanged:(UITextField *)textField
{
    NSString *aString = textField.text;
    if (aString.length == 0) {
        //显示错误信息
        [self showErrorViewAndTextFiled:textField AndErrorText:@""];
        self.rightImageView.image = [UIImage imageNamed:@"img290"];
        return;
    }
    // 正则验证
    if (![Utils boolValidateAndRules:self.validateRules AndDetaileText:textField.text]) {
        //显示错误信息
        [self showErrorViewAndTextFiled:textField AndErrorText:self.errorDetaileText];
    }else{
        //显示成功信息
        [self showSuccessViewAndTextFiled:textField];
    }

}
#pragma mark 监听事件 开始填写
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"ssssssss------------");
    if (textField.text.length != 0) {
        // 正则验证
        if (![Utils boolValidateAndRules:self.validateRules AndDetaileText:textField.text]) {
            //显示错误信息
            [self showErrorViewAndTextFiled:textField AndErrorText:self.errorDetaileText];
        }else{
            //显示成功信息
            [self showSuccessViewAndTextFiled:textField];
        }
        [errorAlertView removeFromSuperview];
        //判断如何显示
        [self boolShowOrHiddenTextFiledEndEdit:textField];
    }else{
        self.rightImageView.image = [UIImage imageNamed:@"img190"];
    }
}
#pragma mark 监听事件 编辑结束
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length != 0) {
        [errorAlertView removeFromSuperview];
        errorAlertView = nil;
        if (self.iSSuccess == NO) {
            //显示错误信息
            [self showErrorViewAndTextFiledEnd:textField];
        }else{
            //显示成功信息
            [self showSuccessViewAndTextFiled:textField];
        }
    }else{
        self.rightImageView.image = [UIImage imageNamed:@"img190"];
    }
}
//显示错误信息
-(void)showErrorViewAndTextFiled:(UITextField *)textFiled AndErrorText:(NSString *)errorStr
{
    
    self.rightImageView.image = [UIImage imageNamed:@"img1"];
    //获取宽度
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
    CGSize btnSize = [self.errorDetaileText sizeWithAttributes:dict];
    CGRect frame1 = CGRectMake(WidthScreen-55-btnSize.width, self.frame.size.height-7, btnSize.width+10, 30);
    /**
     *  下面的判断可加可不加
     */
    if(errorStr.length != 0){
        [self showViewframe:frame1 andStr:errorStr];
    }else{
        [errorAlertView removeFromSuperview];
        errorAlertView = nil;
    }
    self.iSSuccess = NO;
}
//显示错误信息
-(void)showErrorViewAndTextFiledEnd:(UITextField *)textFiled
{
    self.rightImageView.image = [UIImage imageNamed:@"img1"];
    [errorAlertView removeFromSuperview];
    errorAlertView = nil;
    self.iSSuccess = NO;
}
//显示成功信息
-(void)showSuccessViewAndTextFiled:(UITextField *)textFiled
{
    self.rightImageView.image = [UIImage imageNamed:@"img2"];
    [errorAlertView removeFromSuperview];
    errorAlertView = nil;
    self.iSSuccess = YES;
}
//显示布局 只有为错误的时候才调用
-(void)showViewframe:(CGRect)frame andStr:(NSString *)str
{
    
    [errorAlertView removeFromSuperview];
    errorAlertView = nil;
    errorAlertView = [[UIView alloc] initWithFrame:frame];
    errorAlertView.layer.cornerRadius = 3;
    errorAlertView.layer.masksToBounds = YES;
    errorAlertView.backgroundColor =[UIColor clearColor];
    UIImageView *img1 = [[UIImageView alloc] init];
    img1.frame = CGRectMake(frame.size.width-33, 0, 15, 7);
    img1.image = [UIImage imageNamed:@"img3.png"];
    [errorAlertView addSubview:img1];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, frame.size.width, frame.size.height-9)];
    lab.text = str;
    lab.backgroundColor = [UIColor redColor];
    lab.textColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:12];
    lab.layer.cornerRadius = 3;
    lab.layer.masksToBounds = YES;
    [errorAlertView addSubview:lab];
    [self.superview addSubview:errorAlertView];
    
}
//判断错误信息还是正确信息
-(void)boolShowOrHiddenTextFiledEndEdit:(UITextField *)textField
{
    if (self.iSSuccess == NO) {
        [self showErrorViewAndTextFiled:textField AndErrorText:self.errorDetaileText];
    }else{
        [self showSuccessViewAndTextFiled:textField];
    }
    
}



@end
