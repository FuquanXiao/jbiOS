//
//  ViewController.m
//  APPTest
//
//  Created by apple on 2019/2/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "ViewController.h"
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kSpaceW(W) W * (kScreenWidth / 375.0)
#define kSpaceH(H) H * (kScreenWidth / 375.0)

#pragma mark***********************************





#if isPhoneSe
#define font7  ([UIFont systemFontOfSize:7])
#define font8  ([UIFont systemFontOfSize:8])
#define font9  ([UIFont systemFontOfSize:9])
#define font10 ([UIFont systemFontOfSize:10])
#define font11 ([UIFont systemFontOfSize:10])
#define font12 ([UIFont systemFontOfSize:11])
#define font13 ([UIFont systemFontOfSize:12])
#define font14 ([UIFont systemFontOfSize:13])
#define font15 ([UIFont systemFontOfSize:14])
#define font16 ([UIFont systemFontOfSize:15])
#define font17 ([UIFont systemFontOfSize:15])
#define font18 ([UIFont systemFontOfSize:16])
#define font19 ([UIFont systemFontOfSize:17])
#define font20 ([UIFont systemFontOfSize:18])
#define font21 ([UIFont systemFontOfSize:18])
#define font22 ([UIFont systemFontOfSize:20])
#define font25 ([UIFont systemFontOfSize:23])
#else
#define font7  ([UIFont systemFontOfSize:kSpaceW(7)])
#define font8  ([UIFont systemFontOfSize:kSpaceW(8)])
#define font9  ([UIFont systemFontOfSize:kSpaceW(9)])
#define font10 ([UIFont systemFontOfSize:kSpaceW(10)])
#define font11 ([UIFont systemFontOfSize:kSpaceW(11)])
#define font12 ([UIFont systemFontOfSize:kSpaceW(12)])
#define font13 ([UIFont systemFontOfSize:kSpaceW(13)])
#define font14 ([UIFont systemFontOfSize:kSpaceW(14)])
#define font15 ([UIFont systemFontOfSize:kSpaceW(15)])
#define font16 ([UIFont systemFontOfSize:kSpaceW(16)])
#define font17 ([UIFont systemFontOfSize:kSpaceW(17)])
#define font18 ([UIFont systemFontOfSize:kSpaceW(18)])
#define font19 ([UIFont systemFontOfSize:kSpaceW(19)])
#define font20 ([UIFont systemFontOfSize:kSpaceW(20)])
#define font21 ([UIFont systemFontOfSize:kSpaceW(21)])
#define font22 ([UIFont systemFontOfSize:kSpaceW(22)])
#define font25 ([UIFont systemFontOfSize:kSpaceW(25)])
#endif




#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kSpaceW(W) W * (kScreenWidth / 375.0)
#define kSpaceH(H) H * (kScreenWidth / 375.0)

//为了我的奖券界面选择按钮下面的滚动小横线
#define  is375      (kScreenWidth == 375 ? 42.f : 47.f)
// iPhone X
#define  WQ_iPhoneX (kScreenWidth == 375.f && kScreenHeight == 812.f ? YES : NO)

// Status bar height.
#define  WQ_StatusBarHeight      (WQ_iPhoneX ? 44.f : 20.f)

// Status bar height.
#define  WQ_LiuHaiBarHeight      (WQ_iPhoneX ? 24.f : 0.f)

// Navigation bar height.
#define  WQ_NavigationBarHeight  44.f

// Tabbar height.
#define  WQ_TabbarHeight         (WQ_iPhoneX ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  WQ_TabbarSafeBottomMargin         (WQ_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  WQ_StatusBarAndNavigationBarHeight  (WQ_iPhoneX ? 88.f : 64.f)

#define WQ_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})
//
#define  isPhoneSe      (kScreenWidth == 320 ? YES : NO)

//
//  FriendsListController.m
//  JBApp
//
//  Created by xfq on 2018/11/4.
//  Copyright © 2018年 apple. All rights reserved.
//




@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *friendsTableView;
//@property (nonatomic,strong)JBControllerTitleView *titleView;
@property (nonatomic,strong)UIView *headerView;
//@property (nonatomic,strong)WQSearchBar *searchView;
@property (nonatomic,strong)NSIndexPath *editingIndexPath;
@property (nonatomic,assign)NSInteger pageCount;
///好友列表
@property (nonatomic,strong)NSMutableDictionary *friendsDataDict;
@property (nonatomic,strong)NSMutableArray *friendsDataKeyArray;

///等待验证的好友请求
@property (nonatomic,strong)NSMutableArray *willVerfifyFriendsArray;
//@property (nonatomic,strong)NewFriendsGuideView *showNewFriends;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.fd_prefersNavigationBarHidden = YES;
    self.pageCount = 1;
    [self _nav];
    [self createUI];
}

- (void)gotoBack{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadFriendReq];
    [self loadFriendListWithPageCount];
}

- (void)addFriendButtonAction:(UIButton *)btn{
   
}

///等待验证的还有请求
- (void)loadFriendReq{
   
}
//好友列表
- (void)loadFriendListWithPageCount{
    
}

- (void)_nav{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    WQNavigationView *naviagtion = [[WQNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, WQ_StatusBarAndNavigationBarHeight) leftImageName:@"JbAPP_Back" leftTitle:nil target:self action:@selector(gotoBack)];
//    [self.view addSubview:naviagtion];
//
//    WQControllerTitleView *titleView =  [[WQControllerTitleView alloc] initWithFrame:CGRectMake(0, WQ_StatusBarAndNavigationBarHeight, kScreenWidth, 39) leftTitle:@"好友列表" showbottomCorner:10];
//    [self.view addSubview:titleView];
    
//    UIButton *addFriendButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleView.frame) - 49 , 0, 39, 39)];
//    [titleView addSubview:addFriendButton];
//    [addFriendButton addTarget:self action:@selector(addFriendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [addFriendButton setImage: [UIImage imageNamed:@"News_AddFriends"] forState:UIControlStateNormal];
}


/// 修改侧滑的样式；https://blog.csdn.net/lin_transform/article/details/78459764
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (self.editingIndexPath) {
        [self configSwipeButtons];
    }
}

- (void)createUI{
    
    [self.view addSubview:self.friendsTableView];
    
}

#pragma mark
#pragma mark-------uitableView delegate datasource   -------


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
 
    
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    for (UIView *view in [tableView subviews]) {
        if ([view isKindOfClass:[NSClassFromString(@"UITableViewIndex") class]]) {
            // 设置字体大小
            //设置view的大小
            view.bounds = CGRectMake(0, 0, 30, 30);
            //单单设置其中一个是无效的
        }
    }
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[];
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}

- (void)configSwipeButtons
{
    /*
     假如仅支持iOS8-10的话，我个人是倾向于创建一个custom class，继承UITableViewCell，然后在该custom class中-(void)layoutSubviews来实现的。那样代码更干净，不需要特意去调用[self.view setNeedsLayout]; 不过为了支持新版本总是要有所牺牲的。
     */
    // 获取选项按钮的reference
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0"))
    {
        // iOS 11层级 (Xcode 9编译): UITableView -> UISwipeActionPullView
        for (UIView *subview in self.friendsTableView.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] && [subview.subviews count] >= 2)
            {
                // 和iOS 10的按钮顺序相反
                UIButton *deleteButton = subview.subviews[1];
                UIButton *readButton = subview.subviews[0];
                deleteButton.backgroundColor = [UIColor redColor];
                [readButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            }
        }
    }
    else
    {
        // iOS 8-10层级: UITableView -> UITableViewCell -> UITableViewCellDeleteConfirmationView
        UITableViewCell *tableCell = [self.friendsTableView cellForRowAtIndexPath:self.editingIndexPath];
        for (UIView *subview in tableCell.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] && [subview.subviews count] >= 2)
            {
                UIButton *deleteButton = subview.subviews[0];
                UIButton *readButton = subview.subviews[1];
                deleteButton.backgroundColor = [UIColor redColor];
                [readButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
                
            }
        }
    }
    
    
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editingIndexPath = indexPath;
    /*
     [self.view setNeedsLayout]; 这一句非常重要，它的作用强制UITableView重新绘图。只有添加了这一句，- (void)viewDidLayoutSubviews才会被调用，才能使我们的自定义外观生效。
     */
    [self.view setNeedsLayout];   // 触发-(void)viewDidLayoutSubviews
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editingIndexPath = nil;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [tableView setEditing:NO animated:YES];  // 这句很重要，退出编辑模式，隐藏左滑菜单
        
     
        
        
    }];
    deleteAction.backgroundColor = [UIColor magentaColor];
    
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [tableView setEditing:NO animated:YES];  // 这句很重要，退出编辑模式，隐藏左滑菜单
        
       
        
        /*
         这是因为实现了该方法以后，1) 中用的commitEditingStyle:forRowAtIndexPath就不会被触发了，所以删除按钮也需要自己定义。
         [tableView setEditing:NO animated:YES]; 这一行代码很重要，它的效果是在点击之后退出编辑模式，关闭左滑菜单。如果忘了加这一句的话，即使点击了按钮cell也不会还原。在1) 中使用默认模式的时候，系统会自动帮我们调用这一句，现在则需要手动调用
         UITableViewRowActionStyleNormal：灰底白字
           UITableViewRowActionStyleDefault：红底白字
           UITableViewRowActionStyleDestructive：红底白字
         */
    }];
    //    editAction.backgroundColor = [UIColor blueColor];
    return @[deleteAction, editAction];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    editingStyle = UITableViewCellEditingStyleDelete;
    
}
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(11_0) {
    
    UIContextualAction *contextAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        
        
        
        
        
        
    }];
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"备注" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        
    }];
    deleteAction.backgroundColor = [UIColor magentaColor];
    
    
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[contextAction,deleteAction]];
    config.performsFirstActionWithFullSwipe = NO;
    return config;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor grayColor];
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 60;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 24, 30)];
    sectionHeaderView.backgroundColor = [UIColor whiteColor];
    UILabel *indexLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
    [sectionHeaderView addSubview:indexLable];
    NSString *indexString = @"";
    indexLable.text = indexString.length > 0 ? indexString:@"#";
    indexLable.textColor = [UIColor redColor];;
//    indexLable.font = font12;
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 29, kScreenWidth - 44, 1)];
    lineLabel.backgroundColor = [UIColor redColor];
    [sectionHeaderView addSubview:lineLabel];
    
    
    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (NSMutableArray *)friendsDataKeyArray{
    if (!_friendsDataKeyArray) {
        _friendsDataKeyArray = [[NSMutableArray alloc] init];
    }
    return _friendsDataKeyArray;
}

- (NSMutableDictionary *)friendsDataDict{
    if (!_friendsDataDict) {
        _friendsDataDict = [[NSMutableDictionary alloc] init];
    }
    return _friendsDataDict;
}

- (NSMutableArray *)willVerfifyFriendsArray{
    if (!_willVerfifyFriendsArray) {
        _willVerfifyFriendsArray = [[NSMutableArray alloc] init];
    }
    return _willVerfifyFriendsArray;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"暂无明细记录"];
}
- (nullable NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"您还没有添加好友"];
    
    return attribute;
}
- (UITableView *)friendsTableView{
    if (!_friendsTableView) {
        _friendsTableView = [[UITableView alloc] initWithFrame:CGRectMake(12, 0, kScreenWidth - 24, kScreenHeight ) style:UITableViewStyleGrouped];
        _friendsTableView.layer.cornerRadius = 7;
        _friendsTableView.layer.masksToBounds = YES;
        
        _friendsTableView.estimatedSectionFooterHeight = 0;
        _friendsTableView.estimatedSectionHeaderHeight = 0;
        
        if (@available(iOS 11.0, *)) {
            _friendsTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        _friendsTableView.delegate = self;
        _friendsTableView.dataSource = self;
        _friendsTableView.separatorColor = [UIColor clearColor];
        
        //        _friendsTableView.sectionIndexBackgroundColor = [UIColor greenColor];//修改右边索引的背景色
        _friendsTableView.sectionIndexColor = [UIColor blueColor];//修改右边索引字体的颜色
        //        _friendsTableView.sectionIndexTrackingBackgroundColor = [UIColor orangeColor];//
//        [_friendsTableView registerNib:[UINib nibWithNibName:@"UITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
        [_friendsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _friendsTableView;
}


@end
