//
//  TRMessageCell.h
//  TMessage_1.0
//
//  Created by xiaoz on 15/3/31.
//
//

#import <UIKit/UIKit.h>

@interface TRMessageCell : UITableViewCell
@property(nonatomic)BOOL fromMe;
@property(nonatomic,strong)NSString *message;
@property (strong, nonatomic)UIImageView *popImageView;
@property (strong, nonatomic)UILabel *label;
@end
