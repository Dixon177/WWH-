#import <UIKit/UIKit.h>
#import <substrate.h>

// --- إعدادات الـ ESP ---
// تعديل رؤية الأعداء من خلف الجدران
%hook PlayerController
- (bool)isEnemyVisible {
    return YES; // جعل العدو مرئياً دائماً للنظام
}

- (float)getDistanceToPlayer:(id)player {
    float dist = %orig;
    // إضافة كود لرسم الصناديق هنا (ESP Boxes)
    return dist;
}
%end

// --- إعدادات الـ Aimbot ---
// تعديل دقة السلاح وتوجيه الرصاص تلقائياً
%hook WeaponController
- (float)getSpread {
    return 0.0f; // إلغاء انتشار الرصاص (No Spread)
}

- (float)getRecoil {
    return 0.0f; // إلغاء الارتداد (No Recoil)
}
%end

// --- تجاوز حماية اللعبة (Anti-Cheat Bypass) ---
%hook AppsFlyerLib
- (void)trackEvent:(id)arg1 withValues:(id)arg2 {
    // منع اللعبة من إرسال تقارير "تعديل الملفات" للسيرفر
    if ([arg1 containsString:@"cheat"] || [arg1 containsString:@"jailbreak"]) return;
    %orig;
}
%end

%ctor {
    NSLog(@"WWH Hack Loaded by The Architect");
}
