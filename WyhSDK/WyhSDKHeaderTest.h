//
//  WyhSDKHeaderTest.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/13.
//  Copyright © 2017年 王乙涵. All rights reserved.
//



/*!
 @header WyhSDKHeaderTest.h
 
 @brief This is the header file where my super-code is contained.
 
 This file contains the most importnant method and properties decalaration. It's parted by two methods in total, which can be used to perform temperature conversions.
 
 @author 王乙涵
 @copyright  2017 王乙涵
 @version    1.0.0
 
 */



#import <Foundation/Foundation.h>

@interface WyhSDKHeaderTest : NSObject

/*!
 @typedef WeatherConditionsInDays
 
 @brief  A struct about the weather.
 
 @discussion
 The values of this structure represent how many sunny, cloudy, rainy, and snowy days existed over the last year. If this was a real app, they could be perfectly used.
 
 @field sun Good weather
 @field clouds  Where's the sun?
 @field rain    Get an umbrella
 @field snow    Watch out... A snowball is coming!
 */
typedef struct {
    int sun;
    int clouds;
    int rain;
    int snow;
} WeatherConditionsInDays;

/*!  This property knows my name. */
@property (nonatomic, strong) NSString *myName;


/*!
 @brief It converts temperature degrees from Fahrenheit to Celsius scale.
 
 @discussion This method accepts a float value representing the temperature in Fahrenheit scale and it converts it to the Celsius scale.
 
 To use it, simply call @c[self toCelsius: 50];
 
 @param  fromFahrenheit The input value representing the degrees in the Fahrenheit scale.
 
 @return float The degrees in the Celsius scale.
 */
-(float)toCelcius:(float)fromFahrenheit;

/*!
@brief 王胖胖不带我吃鸡
∫
@param  fromCelcius The celsius degrees value. 王胖胖不带我吃鸡

@return float The degrees in the Fahrenheit scale. 王胖胖不带我吃鸡

@code
float f = [self toCelsius:80];  王胖胖不带我吃鸡
@endcode

@remark This is a super-easy method. 王胖胖不带我吃鸡
*/
-(float)toFahrenheit:(float)fromCelcius;

@end
