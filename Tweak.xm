#import <UIKit/UIKit.h>

// --- تفعيل الرؤية ESP ---
%hook PlayerController
- (bool)isEnemyVisible {
    return YES; // كشف الأعداء خلف الجدران
}
%end

// --- تفعيل الدقة Aimbot ---
%hook WeaponController
- (float)getSpread {
    return 0.0f; // إلغاء انتشار الرصاص
}
- (float)getRecoil {
    return 0.0f; // إلغاء الارتداد تماماً
}
%end

// --- حماية Anti-Ban ---
%hook AppsFlyerLib
- (void)trackEvent:(id)arg1 withValues:(id)arg2 {
    // منع إرسال بيانات التعديل إلى سيرفر اللعبة
    if ([arg1 containsString:@"cheat"] || [arg1 containsString:@"jailbreak"]) return;
    %orig;
}
%end
