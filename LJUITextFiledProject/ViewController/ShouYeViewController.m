//
//  ShouYeViewController.m
//  TongChengGou
//
//  Created by liu jing on 16/1/25.
//  Copyright © 2016年 liu jing. All rights reserved.
//

#import "ShouYeViewController.h"
#import "LJUITextFiled.h"
#import "Utils.h"
@interface ShouYeViewController ()<UITextFieldDelegate>
{
    NSMutableArray * textFiledArray;
    UIScrollView *scrollView;
    LJUITextFiled *textFiled1;
    LJUITextFiled *textFiled2;
    NSArray *textPlaceholderArray;
    NSMutableArray *validateRulesArray;
    NSMutableArray *volidateDetaileStrArray;
}
@end
@implementation ShouYeViewController
/**
 *  初始化
 */
-(id)init
{
    self = [super init];
    if (self) {
        textPlaceholderArray = [[NSMutableArray alloc] initWithObjects:@"请输入新的手机号",@"请输入验证码",@"请输入您的邮箱",nil];
        validateRulesArray = [[NSMutableArray alloc] initWithObjects:@"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$",@"^[a-zA-Z0-9]{6,20}+$",@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",nil];
        volidateDetaileStrArray = [[NSMutableArray alloc] initWithObjects:@"请输入正确的手机格式 !",@"请输入6位验证码 !",@"请输入正确的邮箱格式 !", nil];
    }
    return self;
}
/**
 *  view 生命周期
 */
- (void)viewDidLoad{
    [super viewDidLoad];
    scrollView  =[[UIScrollView alloc] initWithFrame:CGRectMake(0,0,WidthScreen,HeightScreen)];
    scrollView.userInteractionEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(WidthScreen, HeightScreen);
    scrollView.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
    [self.view addSubview:scrollView];
    //设置点击scrollView收回键盘
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tapGr.cancelsTouchesInView = NO;
    [scrollView addGestureRecognizer:tapGr];
    self.title = @"LJUITextFiled";
    [self createUI];
}

/**
 *  UIScrollView 收回键盘
 */
-(void)hideKeyboard
{
    [self.view endEditing:YES];
}
/**
 *  创建视图
 */
- (void)createUI{
    // textFiled 的高度
    CGFloat fieldHeight = 40;
    //存放textFiled的数组
    textFiledArray = [NSMutableArray array];
    for (int imi=0; imi<textPlaceholderArray.count; imi++) {
        UIView * bgView=[[UIView alloc]initWithFrame:CGRectMake(20,50+fieldHeight*imi+(imi*25), WidthScreen-40, fieldHeight)];
        [scrollView addSubview:bgView];
        bgView.backgroundColor = [UIColor whiteColor];
        LJUITextFiled * linkTextField=[[LJUITextFiled alloc]initWithFrame:CGRectMake(0, 0, bgView.frame.size.width, fieldHeight)];
        //设置提示信息
        linkTextField.errorDetaileText = volidateDetaileStrArray[imi];
        //设置正则表达式
        linkTextField.validateRules = validateRulesArray[imi];
        linkTextField.tag = imi;
        linkTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 10, fieldHeight)];
        linkTextField.leftViewMode = UITextFieldViewModeAlways;
        linkTextField.rightView = [[UIView alloc] initWithFrame:CGRectMake(bgView.frame.size.width-35, 0, 35, fieldHeight)];
        linkTextField.rightViewMode = UITextFieldViewModeAlways;
        linkTextField.placeholder = textPlaceholderArray[imi];
        linkTextField.backgroundColor = [UIColor clearColor];
        linkTextField.textColor = LightBlackLabelTextColor;
        linkTextField.backgroundColor = [UIColor whiteColor];
        linkTextField.delegate = self;
        linkTextField.layer.borderColor = kSeparatorColorNew.CGColor;
        linkTextField.layer.borderWidth = 0.7;
        linkTextField.layer.cornerRadius = 3;
        linkTextField.layer.masksToBounds = YES;
        linkTextField.font = [UIFont systemFontOfSize:15];
        [bgView addSubview:linkTextField];
        
        [textFiledArray addObject:linkTextField];
    }
    
    
    CGFloat confirmButtonY = HeightScreen-200;
    UIButton *confirmButton = [[UIButton alloc]initWithFrame:CGRectMake(10,confirmButtonY,WidthScreen-20,35)];
    confirmButton.backgroundColor = prefix_TarBarBackColorTwo;
    [confirmButton.layer setCornerRadius:5];
    confirmButton.layer.masksToBounds = YES;
    confirmButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [confirmButton setTitle:@"确定提交" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(confirmButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:confirmButton];
   
}

/**
 *  提交按钮的点击事件
 */
-(void)confirmButtonClick{
    
    for (int imi = 0; imi<textFiledArray.count; imi++) {
        LJUITextFiled *textFiledTemp1 = textFiledArray[imi];
       BOOL iSSuccess = textFiledTemp1.iSSuccess;
        if (iSSuccess == NO) {
            [textFiledTemp1 becomeFirstResponder];
            return;
        }
    }
    UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"提交成功" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView1 show];
}
/**
 *  点击空白处收回键盘
 */
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
/**
 *  控制文本框的位数
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]){
        return YES;
    }
    NSString * aString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    /**
        根据需求去做下面的判断，如果需求不必要，可以省略下面的判断
     */
    if (textField.tag == 0) {
        if ([aString length] > 11) {
            textField.text = [aString substringToIndex:11];
            return NO;
        }
    }
    if (textField.tag == 1) {
        if ([aString length] > 6) {
            textField.text = [aString substringToIndex:6];
            return NO;
        }
    }
    
    
    return YES;
}

@end
