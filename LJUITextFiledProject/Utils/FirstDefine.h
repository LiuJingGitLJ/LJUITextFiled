//
//  FirstDefine.h
//  WeMarried
//
//  Created by 俊海贾 on 15/7/6.
//  Copyright (c) 2015年 俊海贾. All rights reserved.
//

#ifndef FirstDefine_h
#define FirstDefine_h

#define prefix_NewTarBarColor [UIColor colorWithRed:0.98f green:0.98f blue:0.98f alpha:1.00f]
/**导航栏背景色*/
#define prefix_TarBarBackColor [UIColor colorWithRed:0.98f green:0.98f blue:0.98f alpha:1.00f]
//屏幕的高度
#define HeightScreen [UIScreen mainScreen].bounds.size.height
//屏幕的宽度
#define WidthScreen [UIScreen mainScreen].bounds.size.width
//IPHONE4
#define DEVICE_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height < 568)
//得到屏幕尺寸
#define MainScreenSize [UIScreen mainScreen].bounds.size
//定义系统版本
#define SysVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
//自定义TabBar的高度
#define TabBarHeight 55
//自定义NavBar的高度
#define NavBarHeight 64
#define kSeparatorColorNew [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1]
/**轻黑色字体颜色*/
#define LightBlackLabelTextColor [UIColor colorWithRed:0.26f green:0.26f blue:0.26f alpha:1.00f]
/**蓝色背景线*/
#define BlueBackGroundUIColor [UIColor colorWithRed:0.00f green:0.41f blue:0.80f alpha:1.00f]
//＝＝＝＝＝＝＝按钮颜色
#define prefix_TarBarBackColorTwo [UIColor colorWithRed:0.97f green:0.35f blue:0.31f alpha:1.00f]
/**灰色字体颜色*/
#define GrayLableTextUIColor [UIColor colorWithRed:0.50f green:0.50f blue:0.50f alpha:1.00f]
// 用户手机号
#define prefix_userPhone @"userphone"
#define prefix_QiNiuURL @"NewQiNiuDataURL"
#define GrayLineUIColor [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f]
#define GrayLineHeight 0.8
#endif
