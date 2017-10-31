//
//  WyhAddressBookUI.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAddressBookUI.h"
#import <AddressBookUI/AddressBookUI.h>
@interface WyhAddressBookUI()<ABPeoplePickerNavigationControllerDelegate,ABPersonViewControllerDelegate,ABNewPersonViewControllerDelegate>

@end
@implementation WyhAddressBookUI
+(void)choosePerson:(UIViewController *)vc{
    
    //1.创建联系人选择控制器
    ABPeoplePickerNavigationController *pickVc = [ABPeoplePickerNavigationController new];
    
    //2.设置代理
    pickVc.peoplePickerDelegate = self;
    
    //弹出控制器
    [vc presentViewController:pickVc animated:YES completion:nil];
}

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person{
    //选择某个联系人的时候调用
    NSLog(@"选中了某个联系人");
    // 取出联系人的姓名数据
    CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
    // 将CoreFoundation的字符串, 转化为OC的字符串, 并且转移内存管理权
    NSString *first = CFBridgingRelease(firstName);
    NSString *last = CFBridgingRelease(lastName);
    
    NSLog(@"%@--%@", first, last);
    // 取出电话的数据
    ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFIndex count = ABMultiValueGetCount(multi);
    for (int i = 0; i < count; i++) {
        NSString *label = (__bridge_transfer NSString *)ABMultiValueCopyLabelAtIndex(multi, i);
        NSString *phone = (__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(multi, i);
        NSLog(@"%@---%@", label, phone);
    }
 
}
+(void)lookPerson:(UIViewController *)vc{
    NSLog(@"崩溃失效");
    return;
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    
    ABRecordRef person = ABAddressBookGetPersonWithRecordID(addressBook, 1);
    
    ABPersonViewController *viewController = [[ABPersonViewController alloc] init];
    viewController.personViewDelegate = self;
    viewController.displayedPerson = person;
    viewController.allowsActions = NO;
    viewController.allowsEditing = YES;
   viewController.displayedProperties = @[[NSNumber numberWithInt:kABPersonPhoneProperty]];
    [vc.navigationController pushViewController:viewController animated:YES];
    CFRelease(addressBook);
}
- (BOOL)personViewController:(nonnull ABPersonViewController *)personViewController shouldPerformDefaultActionForPerson:(nonnull ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    return YES;
}
+(void)addPerson:(UIViewController *)vc{
    ABNewPersonViewController *picker = [[ABNewPersonViewController alloc] init];
    picker.newPersonViewDelegate = self;
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:picker];
    [vc presentModalViewController:navigation animated:YES];
    
}
-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}
- (void)newPersonViewController:(nonnull ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(nullable ABRecordRef)person {
    
}

@end
