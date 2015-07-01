//
//  TRMessageCell.m
//  TMessage_1.0
//
//  Created by xiaoz on 15/3/31.
//
//

#import "TRMessageCell.h"

@implementation TRMessageCell

#define CELL_MARGIN_TB      4.0     //气泡上下外边距
#define CELL_MARGIN_LR      10.0    //气泡左右外边距

#define CELL_CORNOR         18.0    //气泡圆角半径
#define CELL_TAIL_WIDTH     16.0    //气泡尾巴

#define MAX_WIDTH_OF_TEXT   200.0   //文字宽度限制
#define CELL_PADDING        8.0        //气泡内边距

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.numberOfLines = 0;
    }
    return _label;
}

-(UIImageView *)popImageView{
    if (!_popImageView) {
        _popImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_popImageView];
    }
    return _popImageView;
}

- (void)setMessage:(NSString *)message{
    
    _message = message;
    self.label.text = self.message;
    
    //根据消息的来源，对label和image进行定位
    if (self.fromMe) {//蓝色气泡
        
        //设置标签内容和图片视图中的气泡图片
        self.label.textColor = [UIColor whiteColor];
        
        UIImage *image = [UIImage imageNamed:@"message_i.png"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR, CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH)];
        self.popImageView.image = image;
        
        //1。定位Label
        // 先确定文本的高度
        CGRect rectOfText = CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999);
        
        rectOfText = [self.label textRectForBounds:rectOfText limitedToNumberOfLines:0];
        
        
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = rectOfText.size;
        frameOfLabel.origin.y = CELL_MARGIN_TB + CELL_PADDING;
        frameOfLabel.origin.x = self.bounds.size.width - CELL_MARGIN_LR - CELL_TAIL_WIDTH - CELL_PADDING - rectOfText.size.width;
        self.label.frame = frameOfLabel;
        
        //2。定位popImageView的坐标
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x -=CELL_PADDING;
        frameOfPop.origin.y -=CELL_PADDING;
        frameOfPop.size.width += 2 * CELL_PADDING + CELL_TAIL_WIDTH
        ;
        frameOfPop.size.height += 2 * CELL_PADDING;
        self.popImageView.frame = frameOfPop;
        
        //3.设定单元格的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height + CELL_MARGIN_TB * 2;
        self.bounds = bounds;
    }else{//灰色气泡
        self.label.textColor = [UIColor darkGrayColor];
        
        UIImage *image = [UIImage imageNamed:@"message_other.png"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH, CELL_CORNOR, CELL_CORNOR)];
        self.popImageView.image = image;
        
        CGRect rectOfText = CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999);
        rectOfText = [self.label textRectForBounds:rectOfText limitedToNumberOfLines:0];
        
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = rectOfText.size;
        frameOfLabel.origin.x = CELL_PADDING+CELL_MARGIN_LR+CELL_TAIL_WIDTH;
        frameOfLabel.origin.y = CELL_MARGIN_TB + CELL_PADDING;
        self.label.frame = frameOfLabel;
        
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x -=(CELL_PADDING + CELL_TAIL_WIDTH);
        frameOfPop.origin.y -=CELL_PADDING;
        frameOfPop.size.width += CELL_PADDING*2+CELL_TAIL_WIDTH;
        frameOfPop.size.height += CELL_PADDING*2;
        self.popImageView.frame = frameOfPop;
        
        
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height + CELL_MARGIN_TB *2;
        self.bounds = bounds;
    }
    [self.contentView addSubview:_popImageView];
    [self.contentView addSubview:_label];

}

@end
