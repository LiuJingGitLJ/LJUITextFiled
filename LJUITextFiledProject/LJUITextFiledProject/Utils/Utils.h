//
//  Utils.h
//  WeMarried
//
//  Created by 俊海贾 on 15/7/15.
//  Copyright (c) 2015年 俊海贾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
//用户头像
+(NSString *)initImageUrl:(NSString *)imageURl;
//获取下载的名称
+(NSString *)initDownLoadName:(NSString *)name;
//获取下载成功后的名称
+(NSString *)initDownLoadOKName:(NSString *)name;

+(NSString *)shiJianChuoToString:(NSString *)timeString;
//获取时间
+(NSString *)getDateTimeStringNew;
+(BOOL)BoolYiQianDaoAndNewTime:(NSString *)newtime andOldTime:(NSString *)oldtime;
//获取用户ID
+(NSString *)getStringUserID;
//移除账户ID
+(void)removeUserID;
//获取生日字符串
+(NSString *)GetBirthDayAndShiJianChuo:(NSString *)timeString;
//修改金额
+(NSString *)changeMoneyPoint:(NSString *)moneyStr;
//截取日期
+(NSString *)changeCreateTimeSubString:(NSString *)createTime;

//获取会员等级
+(int)getGradeNumber:(int)gradeValue;
//手机号码验证
+(BOOL)boolMobileValidate:(NSString *)mobile;
//密码格式
+ (BOOL)boolPasswordValidate:(NSString *)passWord;
//电话号码格式判断
+ (BOOL)boolDianHuaHaoValidate:(NSString *)mobile;
//邮箱格式验证
+(BOOL)boolEmailValidate:(NSString *)emailStr;
//QQ号码格式验证
+(BOOL)boolQQValidate:(NSString *)qqStr;
//用户名panduan
+(BOOL)boolSuccessStr:(NSString *)successStr;
//判断银行卡卡账号
+(BOOL)boolBankCardStr:(NSString *)cardStr;
//价格判断
+(BOOL)boolJiaGePriceStr:(NSString *)priceStr;
//判断是否为Double类型
+(BOOL)boolDoubleDataStr:(NSString *)doubleStr;
//判断百分比
+(BOOL)boolBaiFenaBiDataStr:(NSString *)dataStr;
//联系人判断
+(BOOL)boolLianXiRenDataStr:(NSString *)dataStr;
//商家地址判断
+(BOOL)boolDiZhiPanDuanDataStr:(NSString *)dataStr;
//联系人判断
+(BOOL)boolLianXiRenTwoDataStr:(NSString *)dataStr;
//传入正则表达式
+(BOOL)boolValidateAndRules:(NSString *)rules AndDetaileText:(NSString *)text;
//
+(NSString *)getStringUserPhone;
//获取七牛的地址
+(NSString *)getQiNiuURL;
@end
