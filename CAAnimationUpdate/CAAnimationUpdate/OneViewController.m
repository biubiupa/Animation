//
//  ViewController.m
//  CAAnimationUpdate
//
//  Created by malf on 2017/11/10.
//  Copyright © 2017年 DST. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()
@property (weak, nonatomic) CALayer *redlayer;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self creatViewWithCenter:CGPointMake(200, 100) backgroundColor:[UIColor redColor]];
    [self creatViewWithCenter:CGPointMake(300, 350) backgroundColor:[UIColor yellowColor]];
    [self creatViewWithCenter:CGPointMake(200, 600) backgroundColor:[UIColor blueColor]];
    [self creatViewWithCenter:CGPointMake(100, 350) backgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view, typically from a nib.
    

    CALayer *yellowlayer=[CALayer layer];
    yellowlayer.backgroundColor=[UIColor yellowColor].CGColor;
    yellowlayer.bounds=CGRectMake(0, 0, 50, 50);
//    redlayer.position=self.view.center;
    [self.view.layer addSublayer:yellowlayer];
    CAKeyframeAnimation *keyanimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
     UIBezierPath *bezierpath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 500)];
    keyanimation.duration=1.5;
    keyanimation.path=bezierpath.CGPath;
    keyanimation.repeatCount=CGFLOAT_MAX;
    keyanimation.calculationMode=kCAAnimationPaced;
    [yellowlayer addAnimation:keyanimation forKey:nil];
    CAKeyframeAnimation *key=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    key.duration=0.8;
    key.values=@[@(-M_PI_4/5),@(M_PI_4/5),@(-M_PI_4/5)];
    key.repeatCount=CGFLOAT_MAX;
    [yellowlayer addAnimation:key forKey:nil];

    CALayer *redlayer=[CALayer layer];
    redlayer.backgroundColor=[UIColor redColor].CGColor;
    redlayer.bounds=CGRectMake(0, 0, 100, 100);
    self.redlayer=redlayer;
    [self.view.layer addSublayer:redlayer];
    [self.redlayer addAnimation:[self groupBegin] forKey:nil];
    
}
- (void)creatViewWithCenter: (CGPoint)center backgroundColor: (UIColor *)backgroundColor {
    UIView *view=[[UIView alloc] init];
    view.bounds=CGRectMake(0, 0, 10, 10);
    view.center=center;
    view.backgroundColor=backgroundColor;
    [self.view addSubview: view];
    
}
- (CAAnimationGroup *)groupBegin {
    CAAnimationGroup *aniGroup=[[CAAnimationGroup alloc] init];
    
//    旋转动画
    CABasicAnimation *rotationAni=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAni.toValue=@(M_PI * 2);
//    缩放动画
    CABasicAnimation *scaleAni=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.toValue=@(0.2);
//    曲线滑动动画
    CAKeyframeAnimation *frameAni=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *beziePath=[UIBezierPath bezierPathWithArcCenter:self.view.center radius:150 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    frameAni.path=beziePath.CGPath;
    frameAni.calculationMode=kCAAnimationPaced;
    aniGroup.animations=@[rotationAni, scaleAni, frameAni];
    aniGroup.duration=2;
    aniGroup.repeatCount=CGFLOAT_MAX;
    
    return aniGroup;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
