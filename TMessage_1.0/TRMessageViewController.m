//
//  TRMessageViewController.m
//  TMessage_1.0
//
//
//

#import "TRMessageViewController.h"
#import "TRMessageCell.h"

@interface TRMessageViewController ()
@property(nonatomic,strong)NSArray *messages;
@end

@implementation TRMessageViewController

- (NSArray *)messages{
    if (!_messages) {
        _messages = @[@"111",@"3333333333333333333333333333333333"];
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass: [TRMessageCell class] forCellReuseIdentifier:@"Cell"];
    NSLog(@"1243");
    NSLog(@"第二次修改");
    }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.message = self.messages[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //在生成cell的时候，在cell的内部曾经
    //根据图片的大小，修改过cell的bounds属性
    //随着修改bounds属性，cell的frame就自动bei
    //修改了，变成我们根据图片计算出来的高度
    UITableViewCell  *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


@end
