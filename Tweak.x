#import <SpringBoard/SpringBoard.h>
#import <QuartzCore/QuartzCore.h>
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

UIImage* tapImage;
UIImageView* tapImageView;


%hook SpringBoard



- (void)applicationDidFinishLaunching:(id)x {
tapImage = [UIImage imageWithContentsOfFile:@"/Library/RiDan/tap.png"];
	tapImageView = [[UIImageView alloc] initWithImage:tapImage];
	
	
	
	
%orig;
}
%end






%hook UIWindow



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	printf("touch began ----------- \n");

	[UIView animateWithDuration:0.35 animations:^(void) {
	tapImageView.alpha = 1.0;
}];
	%orig;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
		%orig;

	printf("touch moved \n");
	
	UITouch *myTouch = [ touches anyObject];
	
	CGPoint startPoint = [myTouch locationInView:self];
	tapImageView.center = startPoint;
	[self addSubview:tapImageView];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
		printf("touch end ----------- \n");
			[UIView animateWithDuration:0.35 animations:^(void) {
	tapImageView.alpha = 0.0;
}];
	%orig;
}
%end




%hook UIView



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	printf("touch began ----------- \n");

	[UIView animateWithDuration:0.35 animations:^(void) {
	tapImageView.alpha = 1.0;
}];
		%orig;

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
		%orig;

	printf("touch moved \n");
	
	UITouch *myTouch = [ touches anyObject];
	
	CGPoint startPoint = [myTouch locationInView:self];
	tapImageView.center = startPoint;
	[self addSubview:tapImageView];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
		printf("touch end ----------- \n");
			[UIView animateWithDuration:0.35 animations:^(void) {
	tapImageView.alpha = 0.0;
}];
	%orig;
}
%end



