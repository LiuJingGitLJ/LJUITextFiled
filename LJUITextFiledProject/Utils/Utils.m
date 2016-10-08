//
//  Utils.m
//  WeMarried
//
//  Created by 俊海贾 on 15/7/15.
//  Copyright (c) 2015年 俊海贾. All rights reserved.
//

#import "Utils.h"

@implementation Utils
static Utils *util = nil;

+(NSString *)initDownLoadName:(NSString *)name
{
    if (util == nil) {
        util = [[Utils alloc] init];
    }
    NSString *fileNameOK  = @"";
    NSString *filename1 = name;
    if (filename1.length>=24) {
        
        NSString *riQiAndRandomString = [filename1 substringWithRange:NSMakeRange(filename1.length-24, 24)];
        NSString *riQiString = [riQiAndRandomString substringWithRange:NSMakeRange(0, 19)];
        if ( [util isEmail:riQiString] == YES) {
            fileNameOK = [filename1 substringWithRange:NSMakeRange(0, filename1.length-24)];
            if (fileNameOK.length>0) {
                fileNameOK = [fileNameOK substringWithRange:NSMakeRange(0, fileNameOK.length-1)];
            }
            if (fileNameOK.length == 0) {
                fileNameOK = @"zjyt";
            }
            
        }else{
            fileNameOK = filename1;
        }
    }else{
        fileNameOK = filename1;
    }
    NSLog(@"filenameOK---%@",fileNameOK);
    
    
    return fileNameOK;
}
+(NSString *)initDownLoadOKName:(NSString *)name
{
    if (util == nil) {
        util = [[Utils alloc] init];
    }
    NSString *fileNameOK  = @"";
    NSString *timeString = [util getDateTimeString];
    NSString *randomString = [util randomStringWithLength:4];
    fileNameOK = [NSString stringWithFormat:@"%@_%@_%@",name,timeString,randomString];
    return fileNameOK;
}

+(NSString *)shiJianChuoToString:(NSString *)timeString
{
    if (util == nil) {
        util = [[Utils alloc] init];
    }
    long long int date1 = (long long int)[timeString intValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:date1];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
//手机号码验证
+(BOOL)boolMobileValidate:(NSString *)mobile
{
    //手机号以13，14， 15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^(0|86|17951)?(13[0-9]|15[0－9]|17[0-9]|18[0-9]|14[0-9])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//密码格式
+ (BOOL)boolPasswordValidate:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}
//电话号码格式判断
+(BOOL)boolDianHuaHaoValidate:(NSString *)mobile
{
    NSString *phoneRegex = @"^(\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
    
}
//邮箱格式验证
+(BOOL)boolEmailValidate:(NSString *)emailStr
{
    
    //NSString *phoneRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSString *phoneRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:emailStr];
}
//QQ号码格式验证
+(BOOL)boolQQValidate:(NSString *)qqStr
{
    NSString *phoneRegex = @"^[1-9][0-9]{4,}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:qqStr];
}
//用户名panduan
+(BOOL)boolSuccessStr:(NSString *)successStr
{
    NSString *phoneRegex = @"(^[A-Za-z0-9]{3,20}$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:successStr];
}
//判断银行卡卡账号
+(BOOL)boolBankCardStr:(NSString *)cardStr
{
    NSString *phoneRegex = @"^\\d{16}|\\d{19}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:cardStr];
}
//价格判断
+(BOOL)boolJiaGePriceStr:(NSString *)priceStr
{
    NSString *phoneRegex = @"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:priceStr];
}
//判断是否为Double类型
+(BOOL)boolDoubleDataStr:(NSString *)doubleStr
{
    NSString *phoneRegex = @"^(([1-9][0-9]*)|((([1-9][0-9]*)|0)\\.[0-9]{1,2}))$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:doubleStr];
}
/**判断百分比*/
+(BOOL)boolBaiFenaBiDataStr:(NSString *)dataStr
{
    NSString *phoneRegex = @"^\\d+\\.?\\%$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:dataStr];
}
/**联系人判断*/
+(BOOL)boolLianXiRenTwoDataStr:(NSString *)dataStr
{
    NSString *phoneRegex = @"(^[A-Za-z0-9\u4E00-\u9FA5_-]{6,20}$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:dataStr];
}

/**联系人判断*/
+(BOOL)boolLianXiRenDataStr:(NSString *)dataStr
{
    NSString *phoneRegex = @"(^[A-Za-z0-9\u4E00-\u9FA5_-]+$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:dataStr];
}
/**商家地址判断*/
+(BOOL)boolDiZhiPanDuanDataStr:(NSString *)dataStr
{
    NSString *phoneRegex = @"(^[A-Za-z0-9\u4E00-\u9FA5_-]+$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:dataStr];
}
/**传入正则表达式*/
+(BOOL)boolValidateAndRules:(NSString *)rules AndDetaileText:(NSString *)text
{
    //手机号以13，14， 15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = rules;
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:text];
}
//======================
/**获取时间戳字符串*/
+(NSString *)getDateTimeStringNew
{
    NSDateFormatter *formatter;
    NSString *dateString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM.dd"];
    dateString = [formatter stringFromDate:[NSDate date]];
    return dateString;
}
//获取生日字符串
+(NSString *)GetBirthDayAndShiJianChuo:(NSString *)timeString
{
    if (util == nil) {
        util = [[Utils alloc] init];
    }
    long long int date1 = (long long int)[timeString intValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:date1];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
+(BOOL)BoolYiQianDaoAndNewTime:(NSString *)newtime andOldTime:(NSString *)oldtime
{
    if (util == nil) {
        util = [[Utils alloc] init];
    }
    
    newtime = [newtime substringWithRange:NSMakeRange(0, 8)];
    oldtime = [newtime substringWithRange:NSMakeRange(0, 8)];
    if (newtime.intValue - oldtime.intValue > 0) {
        NSLog(@"222222");
        return YES;
    }
    
    return NO;
}
+(NSString *)BoolShiJianJianGeAndOldTimeTwo:(NSString *)oldtime
{
    if (util == nil) {
        util = [[Utils alloc] init];
    }
    NSString *stringJianGe = @"";
    NSDate  *m_pStartDate = [NSDate date];
    double m_fGameTime = oldtime.doubleValue;
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[m_pStartDate timeIntervalSince1970]];
    timeSp = @"1464322417";
    double deltaTime = timeSp.doubleValue;
    
    NSLog(@"m_fGameTime---%f-----%f",m_fGameTime,deltaTime);
    double remainTime = deltaTime - m_fGameTime;
    NSLog(@"jiange---%f",remainTime);
    stringJianGe = [util showTime:remainTime];
    
    return stringJianGe;
}
//修改金额
+(NSString *)changeMoneyPoint:(NSString *)moneyStr
{
    NSString *newMoneyStr = @"0.00";
    if ([moneyStr containsString:@"."]) {
        NSArray *moneyArray = [moneyStr componentsSeparatedByString:@"."];
        NSString *string1 = moneyArray[0];
        NSString *string2 = moneyArray[1];
        if (string2.length == 1) {
            string2 = [NSString stringWithFormat:@"%@0",string2];
            newMoneyStr = [NSString stringWithFormat:@"%@.%@",string1,string2];
            return newMoneyStr;
        }
        if (string2.length == 2) {
            newMoneyStr = moneyStr;
            return newMoneyStr;
        }
        if (string2.length>2) {
            string2 = [string2 substringWithRange:NSMakeRange(0, 2)];
            newMoneyStr = [NSString stringWithFormat:@"%@.%@",string1,string2];
            return newMoneyStr;
        }
        
    }else{
        newMoneyStr = [NSString stringWithFormat:@"%@.00",moneyStr];
        return newMoneyStr;
    }
    return newMoneyStr;
}
//截取日期
+(NSString *)changeCreateTimeSubString:(NSString *)createTimeStr
{
    createTimeStr = [createTimeStr substringWithRange:NSMakeRange(0, 16)];
    return createTimeStr;
    
}
//获取会员等级
+(int)getGradeNumber:(int)gradeValue
{
    int gradeNumber = 0;
    if (gradeValue > 0 && gradeValue <= 500) {
        gradeNumber = 0;
    }
    if (gradeValue >= 501 && gradeValue <= 2000) {
        gradeNumber = 1;
    }
    if (gradeValue >= 2001 && gradeValue <= 5000) {
        gradeNumber = 2;
    }
    if (gradeValue >= 5000 && gradeValue <= 20000) {
        gradeNumber = 3;
    }
    if (gradeValue >= 20001 && gradeValue <= 50000) {
        gradeNumber = 4;
    }
    if (gradeValue >= 50000 && gradeValue <= 100000) {
        gradeNumber = 5;
    }
    if (gradeValue > 100000) {
        gradeNumber = 6;
    }
    return gradeNumber;
}
/*
 *在text视图中显示时间
 */
#pragma mark 定时器方法
- (NSString *)showTime:(double)time
{
    int inputSeconds = (int)time ;
    int days =  inputSeconds /3600/24;
    
    NSLog(@"days---%d",days);
    NSString *dayString = [NSString stringWithFormat:@"%.2d",days];
//    int hours =  (inputSeconds-(days*3600*24)) / 3600;
//    int minutes = (inputSeconds - hours*3600-days*3600*24) / 60;
//    int seconds = inputSeconds-days*3600*24-hours*3600-minutes * 60;
   //  NSString *strTime = [NSString stringWithFormat:@"%.2d天:%.2d时:%.2d分:%.2d秒",days,hours, minutes, seconds];
    
    return dayString;
}

//获取时间戳字符串
- (NSString *)getDateTimeString
{
    NSDateFormatter *formatter;
    NSString *dateString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
    dateString = [formatter stringFromDate:[NSDate date]];
    return dateString;
}
- (BOOL)isEmail:(NSString*)candidate
{
    NSString *regex = @"^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))_(20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:candidate];
}
//获取长度
- (NSString *)randomStringWithLength:(int)len
{
    NSString *letters = @"0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }
    return randomString;
}

@end
