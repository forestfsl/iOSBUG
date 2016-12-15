# iOSBUG
ios bug 总结

一：iOS 返回手势时导航栏消失问题
Bug是这样的，两个控制器的状态栏和导航栏样式不一样的适合，返回手势稍微返回一点点，然后松开。停留在当前页面，这时会就会发现导航栏消失了

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


