class AppDelegate
  APP_URL = "https://itunes.apple.com/cn/app/id901152908?mt=8"
  attr_reader :window
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    documents_path         = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
    NanoStore.shared_store = NanoStore.store(:file, documents_path + "/nano.db") # persist the data  
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = MainController.new
    #    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(MainController.new)
    @window.makeKeyAndVisible
    ConfigInfo.load_language

    locale = NSLocale.alloc.initWithLocaleIdentifier("zh-Hans")
    true
  end
end
