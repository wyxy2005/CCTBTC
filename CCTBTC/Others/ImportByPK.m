//
//  ImportByPK.m
//  CCTBTC
//
//  Created by Helios on 2019/2/20.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "ImportByPK.h"
#import <CCTBTCLib/CCTBTCLib.h>

@interface ImportByPK ()

@property (weak, nonatomic) IBOutlet UITextField *pktext;

@property (weak, nonatomic) IBOutlet UITextView *walletT;

@end

@implementation ImportByPK

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通过私钥导入钱包";
}

- (IBAction)btnAction:(id)sender {
    
    _pktext.text = @"KzuyUq5NKqc7EdUarjwXc1GKLJzWM48rGz9pVzDADK3cjsAD95eM";
    
    if(_pktext.text.length == 0){
        return;
    }
    
    [CCTBTCLib importWalletByPrivateKey:_pktext.text Newwork:mainnet resultBlock:^(NSString *private, NSString *address) {
        
        self.walletT.text = [NSString stringWithFormat:@"【私钥】%@ \n\n【地址】%@ \n\n",private,address];
    } error:^{
        
    }];
}

@end
