//
//  WyhAddressBook.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/30.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAddressBook.h"
#import <AddressBook/AddressBook.h>
@implementation WyhAddressBook


+(void)request{
    //如果没有授权过，请求授权
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        //创建通讯录
        ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
        
        //请求授权
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            if (granted) {
                //请求授权页面用户同意授权
                //读取通讯录人员数量，此处不可使用上面请求授权的通讯录对象，会崩溃
                ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
                //获取联系人数量
                CFIndex personCount = ABAddressBookGetPersonCount(addressBook);
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                });
                CFRelease(addressBook);
            }
            CFRelease(addressBookRef);
        });
    }else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        //如果是已授权状态
        //创建通讯录
        //读取通讯录人员数量
        ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
        CFIndex personCount = ABAddressBookGetPersonCount(addressBookRef);
        CFRelease(addressBookRef);
    }else{
        NSLog(@"请在设置中打开通讯录授权");
    }
}
+(void)getPerson{
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    //拿到所有联系人
    CFArrayRef peopleArray = ABAddressBookCopyArrayOfAllPeople(addressBook);
    //数组数量
    CFIndex pepleCount = CFArrayGetCount(peopleArray);
    for (int i = 0; i<pepleCount; i++) {
        //拿到一个人
        ABRecordRef person = CFArrayGetValueAtIndex(peopleArray, i);
        //拿到姓名
        //姓
        NSString *lastaNameValue = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
        //名
        NSString *firstNameValue = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        //拿到多值电话
        ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
        
        //多值数量
        CFIndex phoneCount = ABMultiValueGetCount(phones);
        for (int j = 0 ; j<phoneCount; j++) {
            //电话标签本地化（例如是住宅，工作等）
            NSString *phoneLabel = (__bridge_transfer NSString *)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phones, j));
            //拿到标签下对应的电话号码
            NSString *phoneValue = (__bridge_transfer NSString *)ABMultiValueCopyLabelAtIndex(phones, j);
            
            
        }
        CFRelease(phones);
        //邮箱多值
        ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
        CFIndex emaiCount = ABMultiValueGetCount(emails);
        for (int k = 0 ; k<emaiCount; k++) {
            NSString *emailLabel = (__bridge_transfer NSString *)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(emails, k));
            NSString *emailValue = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emails, k);
            
        }
        CFRelease(emails);
    }
    CFRelease(addressBook);
    CFRelease(peopleArray);
}

+(void)newPerson{
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    //创建一个联系人
    ABRecordRef person = ABPersonCreate();
    //新增姓名
    NSString *Name = @"王乙涵";
    //转换为CFString
    CFStringRef lastName = (__bridge_retained CFStringRef)Name;
    //设置属性
    ABRecordSetValue(person, kABPersonLastNameProperty, lastName, NULL);
    CFRelease(lastName);
    
    //新增电话
    ABMultiValueRef phones = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    //手机标签设置值
    CFStringRef mobile = (__bridge_retained CFStringRef)@"17772447921";
    ABMultiValueAddValueAndLabel(phones, mobile, kABPersonPhoneMobileLabel, NULL);
    CFRelease(mobile);
    
    //住宅标签设置值
    CFStringRef homeTel = (__bridge_retained CFStringRef)@"重庆";
    ABMultiValueAddValueAndLabel(phones, homeTel, kABHomeLabel, NULL);
    CFRelease(homeTel);
    
    //工作标签设置值
    CFStringRef workTel = (__bridge_retained CFStringRef)@"88888888";
    ABMultiValueAddValueAndLabel(phones, workTel, kABWorkLabel, NULL);
    CFRelease(workTel);
    
    //其他标签设置值
    CFStringRef otherTel = (__bridge_retained CFStringRef)@"66666666";
    ABMultiValueAddValueAndLabel(phones, otherTel, kABOtherLabel, NULL);
    CFRelease(otherTel);
    
    //为联系人的电话多值 设置值
    ABRecordSetValue(person, kABPersonPhoneProperty, phones, NULL);
    
    //新增邮箱
    ABMultiValueRef emails = ABMultiValueCreateMutable(kABPersonEmailProperty);
    
    //住宅邮箱设置值
    CFStringRef email = (__bridge_retained CFStringRef)@"572466520@qq.com";
    ABMultiValueAddValueAndLabel(emails, email, kABHomeLabel, NULL);
    CFRelease(email);
    
    //为联系人添加邮箱多值
    ABRecordSetValue(person, kABPersonEmailProperty, emails, NULL);
    
    //给通讯录添加联系人
    ABAddressBookAddRecord(addressBook, person, NULL);
    
    CFRelease(person);
    CFRelease(phones);
    CFRelease(emails);
    
    //保存通讯录，一定要保存
    ABAddressBookSave(addressBook, NULL);
    CFRelease(addressBook);
}
@end
