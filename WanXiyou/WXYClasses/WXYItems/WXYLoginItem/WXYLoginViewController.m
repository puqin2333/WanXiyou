//
//  WXYLoginViewController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/7.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYLoginViewController.h"

@interface WXYLoginViewController ()<UITextFieldDelegate>

@property(nonatomic, strong) UIImageView *logoView;// 中心图标
@property(nonatomic, strong) UIImageView *logoDownView; // 右下角图标
@property(nonatomic, strong) UITextField *usernameTextField; // 用户名输入
@property(nonatomic,strong) UITextField *passwordTextField;   // 秘密输入
@property(nonatomic, strong) UITextField *securityTextField; // 验证码输入
@property(nonatomic, strong) UIButton *logInButton; // 登陆
@property(nonatomic, strong) UIButton *noLogInButton; // 跳过登陆
@property(nonatomic, strong) NSString *cookie;
@property(nonatomic, strong) NSDictionary *userInfoDict;


@end

@implementation WXYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 登陆界面底层图实现
    self.view.backgroundColor = [UIColor colorWithRed:0.01f green:0.60f blue:0.65f alpha:1.00f];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    [self.view addSubview:logoView];
    UIImageView *logoDownView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_1024"]];
    logoDownView.alpha = 0.5;
    logoDownView.transform = CGAffineTransformMakeRotation(- M_PI / 12);
    
    [self.view addSubview:logoDownView];
    
    // 布局
    [logoView mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(kScreenHeight * 0.23);
        make.width.mas_equalTo(kScreenWidht * 0.35);
        make.height.mas_equalTo(kScreenWidht * 0.35);
    }];
    [logoDownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidht);
        make.height.mas_equalTo(kScreenWidht);
        make.right.equalTo(self.view.mas_right).with.offset(kScreenWidht * 0.25);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(kScreenWidht * 0.24);
    }];
    self.logoView = logoView;
    self.logoDownView = logoDownView;
    
    [self initUI];
}

- (void)initUI {
    
    UITextField *usernameTextField = [[WXYTextField alloc] init];
    usernameTextField.placeholder = @"学号";
    usernameTextField.textColor = [UIColor whiteColor];
    usernameTextField.delegate = self;
    [self.view addSubview:usernameTextField];
    // 设置 placeholder
    NSMutableAttributedString *placeholder=[[NSMutableAttributedString alloc] initWithString:usernameTextField.placeholder];
    
    [placeholder addAttribute:NSForegroundColorAttributeName
     
                        value:[UIColor whiteColor]
     
                        range:NSMakeRange(0, usernameTextField.placeholder.length)];
    
    [placeholder addAttribute:NSFontAttributeName
     
                        value:[UIFont boldSystemFontOfSize:14]
     
                        range:NSMakeRange(0, usernameTextField.placeholder.length)];
    
    usernameTextField.attributedPlaceholder = placeholder;
    
    UIView *longLineView = [[UIView  alloc] init];
    longLineView.backgroundColor = [UIColor whiteColor];
    longLineView.alpha = 0.7;
    [self.view addSubview:longLineView];
    
    UITextField *passwordTextField = [[WXYTextField alloc] init];
    passwordTextField.placeholder = @"密码";
    passwordTextField.textColor  = [UIColor whiteColor];
    passwordTextField.delegate = self;
    passwordTextField.secureTextEntry = YES;
    [self.view addSubview:passwordTextField];
    // 设置 placeholder
    NSMutableAttributedString *placeholder1=[[NSMutableAttributedString alloc] initWithString:passwordTextField.placeholder];
    
    [placeholder1 addAttribute:NSForegroundColorAttributeName
     
                        value:[UIColor whiteColor]
     
                        range:NSMakeRange(0, passwordTextField.placeholder.length)];
    
    [placeholder1 addAttribute:NSFontAttributeName
     
                        value:[UIFont boldSystemFontOfSize:14]
     
                        range:NSMakeRange(0, passwordTextField.placeholder.length)];
    
    passwordTextField.attributedPlaceholder = placeholder1;

    
    UIView *longLineView1 = [[UIView  alloc] init];
    longLineView1.backgroundColor = [UIColor whiteColor];
    longLineView1.alpha = 0.7;
    [self.view addSubview:longLineView1];
    
    UITextField *securityTextField = [[WXYTextField alloc] init];
    securityTextField.placeholder = @"验证码";
    securityTextField.textColor  = [UIColor whiteColor];
    securityTextField.delegate = self;
    [self.view addSubview:securityTextField];
    // 设置 placeholder
    NSMutableAttributedString *placeholder3 = [[NSMutableAttributedString alloc] initWithString:securityTextField.placeholder];
    [placeholder3 addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, securityTextField.placeholder.length)];
    [placeholder3 addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:14]
                        range:NSMakeRange(0, securityTextField.placeholder.length)];
    securityTextField.attributedPlaceholder = placeholder3;
    
    UIView *lineView = [[UIView  alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.alpha = 0.7;
    [self.view addSubview:lineView];
    
    UIImageView *securityCodeView = [[UIImageView alloc] init];
    securityCodeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:securityCodeView];
    
    // 给验证码添加点击事件，每点击一次，更新一张验证码
    securityCodeView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeSecurityCodeView)];
    [securityCodeView addGestureRecognizer:singelTap];
    
    
    UIButton *logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logInButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.60f blue:0.00f alpha:1.00f];
    [logInButton setTitle:@"登录" forState:UIControlStateNormal];
    logInButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:logInButton];
    [logInButton addTarget:self action:@selector(logIn) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *noLogInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [noLogInButton setTitle:@"跳过登录" forState:UIControlStateNormal];
    noLogInButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:noLogInButton];

    UIView *shortLineView = [[UIView  alloc] init];
    shortLineView.backgroundColor = [UIColor whiteColor];
    shortLineView.alpha = 0.7;
    [self.view addSubview:shortLineView];
    
    // 布局
    [usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoView.mas_bottom).with.offset(-6 * kScreenRatio);
        make.left.equalTo(self.view.mas_left).with.offset(kScreenWidht * 0.1);
        make.width.mas_equalTo(kScreenWidht * 0.8);
        make.height.mas_equalTo(40 * kScreenRatio);
    }];
    
    [longLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(usernameTextField.mas_bottom);
        make.left.mas_equalTo(usernameTextField.mas_left);
        make.width.mas_equalTo(usernameTextField.mas_width);
        make.height.mas_equalTo(2 * kScreenRatio);
    }];
    
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(longLineView.mas_bottom);
        make.left.mas_equalTo(usernameTextField.mas_left);
        make.width.mas_equalTo(usernameTextField.mas_width);
        make.height.mas_equalTo(40 * kScreenRatio);
    }];
    
    [longLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordTextField.mas_bottom);
        make.left.equalTo(usernameTextField.mas_left);
        make.width.mas_equalTo(usernameTextField.mas_width);
        make.height.mas_equalTo(2 * kScreenRatio);
    }];
    
    [securityTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(longLineView1.mas_bottom);
        make.left.equalTo(usernameTextField.mas_left);
        make.width.mas_equalTo(kScreenWidht * 0.6);
        make.height.mas_equalTo(40 * kScreenRatio);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(securityTextField.mas_bottom);
        make.left.equalTo(usernameTextField.mas_left);
        make.width.mas_equalTo(kScreenWidht * 0.6);
        make.height.mas_equalTo(2 * kScreenRatio);
    }];
    
    [securityCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordTextField.mas_bottom).with.offset(10 * kScreenRatio);
        make.left.equalTo(securityTextField.mas_right).with.offset(5 * kScreenRatio);
        make.right.mas_equalTo(usernameTextField.mas_right);
        make.height.mas_equalTo(30 * kScreenRatio);
    }];
    
    [logInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15 * kScreenRatio);
        make.left.equalTo(securityTextField.mas_left);
        make.width.mas_equalTo(kScreenWidht * 0.8);
        make.height.mas_equalTo(45 * kScreenRatio);
    }];
    
    
    [noLogInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logInButton.mas_bottom).with.offset(5 * kScreenRatio);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(kScreenWidht * 0.3);
        make.height.mas_equalTo(40 * kScreenRatio);
    }];
    
    [shortLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(noLogInButton.mas_bottom);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(65 *kScreenRatio);
        make.height.mas_equalTo(2 * kScreenRatio);
    }];
    
    self.usernameTextField = usernameTextField;
    self.passwordTextField = passwordTextField;
    self.securityTextField = securityTextField;
    self.securityCodeView = securityCodeView;
    self.logInButton = logInButton;
    self.noLogInButton = noLogInButton;

}


#pragma mark --UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
// 键盘消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    [_securityTextField resignFirstResponder];
}

#pragma mark --登陆
- (void)logIn {
    [self.presenter loginWithUsername:_usernameTextField.text password:_passwordTextField.text securityCode:_securityTextField.text cookie:_cookie callback:^(NSDictionary *result) {
        WXYLoginModel *userInfoModel = [WXYLoginModel yy_modelWithDictionary:result];
        if ([userInfoModel.code isEqualToString:@"1"]) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeToMainVC" object:nil userInfo:result];
            
        }
        else {
            UIAlertController *alertController = [UIAlertController showAlertWithTitle:@"登录失败" message:@"请确认输入是否正确！" ];
            [self presentViewController:alertController animated:YES completion:nil];
            [self changeSecurityCodeView];
        }
    }];
}

- (void)noLogin {
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.presenter = [[WXYLoginPresenter alloc] init];
    [self.presenter requestsecurityCode:^(NSDictionary *result) {
        NSDictionary *dict = result;
        self.securityCodeView.image = dict[@"codeView"];
        self.cookie = dict[@"set_Cookie"];
    }];
}

- (void)changeSecurityCodeView {
    self.presenter = [[WXYLoginPresenter alloc] init];
    [self.presenter requestsecurityCode:^(NSDictionary *result) {
        NSDictionary *dict = result;
        self.securityCodeView.image = dict[@"codeView"];
        self.cookie = dict[@"set_Cookie"];
    }];
}


@end
