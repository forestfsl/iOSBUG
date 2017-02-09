# iOSBUG
##ios bug 总结

###一：iOS 返回手势时导航栏消失问题
>Bug是这样的，两个控制器的状态栏和导航栏样式不一样的适合，返回手势稍微返回一点点，然后松开。停留在当前页面，这时会就会发现导航栏消失了
经过折腾后发现是因为方法- (UIStatusBarStyle)preferredStatusBarStyle导致的，也就说，如果不改变状态栏颜色的话，这个bug是不会出现的，所以解决方法可以这个样子：
在导航控制器中重写childViewControllerForStatusBarStyle方法，如下:
//(这个方法在父类中写也可以，在UINavigationController中写也可以)
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.visibleViewController;
}
然后在对应的要修改状态栏颜色的子类控制器中再使用
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault; //UIStatusBarStyleDefault 这个值只是作为一个例子使用
}
例子下载链接https://github.com/forestfsl/iOSBUG/


>第二：iOS 10 设置圆角的视图竟然没有显示，但是在层级关系那里可以看到
原因是：获取UIView的frame不正确问题（返回的width & height 都是 1000）
Xcode8方式编译后，在UIView还没有“布局完毕”的时候默认返回的frame的size大小为1000x1000，等到“布局完毕”后才能获取到正确的大小。
-(void)awakeFromNib{
    [super awakeFromNib];<br>//调用此方法后，才可以获取到正确的frame
    [self.view layoutIfNeeded];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     //调用此方法后，才可以获取到正确的frame
    [self.view layoutIfNeeded];
}


>第三：WKWebView 加载的进度条没有出来，原因是创建ProgressView 加载到ViewDidLoad，之后放到ViewWillAppear，进度条就显示了（进度条是添加在navigationBar view上面的 [self.navigationController.view addSubview:self.progressView]；

>第四：点击底部的TarBarItem的时候出现灰色，想取消点击时候出现的灰色；
@note过程使用的方法有如下：
 >>方法1.刚开始的时候认为是tabBar搞的问题，所以把系统自带的给删掉，还是不行#pragma mark 删除自带tabBar的子控件
-(void)deleteSelfTabBar
{
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:[UIControl class]]) {
            [subView removeFromSuperview];
       }
    }
}
 >>方法2.既然上面没有问题，那肯定不是使用的不是系统自带的tabBarItem，检查代码，发现以前同事使用的是button取代系统自带的tabBarItem,本来也没有发现错误的，因为初始化的时候 UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];，这个保证了点击button的时候button不会变灰，，但是如果button上面设置图片的时候，就需要再加多一句代码了：buttomButton.adjustsImageWhenHighlighted = NO;`（adjustsImageWhenHighlighted:官方解释：A Boolean value that determines whether the image changes when the button is highlighted.
If YES, the image is drawn lighter when the button is highlighted. The default value is YES.）
` @warming 如果是  UIButton *button = [[UIButton alloc]init]; 这样的话，button点击时候就会变灰！

