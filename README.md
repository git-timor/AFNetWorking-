# AFNetWorking-
swift-AFNetWorking封装


这是一个由 Swift写成的AFN的封装
1> 设置一个shared的单例
2> 封装一个request方法，满足GET /POST的调用，并完成回调
3> 单独建立一个extension ，存放各种URL调用
4> 隔离token，将token封装到tokenRequest方法
5> 根据是否存在access_token / 判断失败的task为403 发送通知，告诉程序调起登录界面
           
