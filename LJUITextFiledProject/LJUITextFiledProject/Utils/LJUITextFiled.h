//
//  NTUITextFiled.h
//  YiHeUser
//
//  Created by liu jing on 16/8/18.
//  Copyright © 2016年 liu jing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstDefine.h"
@interface LJUITextFiled : UITextField<UITextFieldDelegate>
/**
 * 判断当前文本框是否满足条件
 */
@property(nonatomic) BOOL iSSuccess;
/**
 *当不满足正则表达式时的错误提示
 */
@property(nullable, nonatomic,copy) NSString  *errorDetaileText;
/**
 * 传入的正则表达式
 */
@property(nullable, nonatomic,copy) NSString *validateRules;

@end
