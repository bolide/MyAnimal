# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'


require "rubygems"
require 'bundler'
require 'bubble-wrap'
require 'ruby_motion_query'
require 'motion-yaml'


#nano-store
require 'motion-cocoapods'
require 'nano-store'
require 'motion-i18n'

Motion::Project::App.setup do |app|

  app.name = '陪孩子听动物叫'
  #app.identifier = "com.huolg.myanimal"
  #  app.provisioning_profile = "/Users/guo/work/ios/profile/myanimal.mobileprovision"
  
  app.frameworks += %w(AVFoundation AudioToolbox)
  app.short_version = '0.0.2'
  #  app.version = app.short_version
  app.version = '0.0.2'

  #  app.sdk_version = '7.1'
  #  app.deployment_target = '7.0'
  # Or for iOS 6
  #app.sdk_version = '6.1'
  #app.deployment_target = '6.0'

  app.icons = ["icon@2x.png", "icon-29@2x.png", "icon-40@2x.png", "icon-60@2x.png", "icon-76@2x.png", "icon-512@2x.png","Icon7.png","icon-76.png"]
  #  app.icons = %w{Icon7.png}

  # prerendered_icon is only needed in iOS 6
  #app.prerendered_icon = true

  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right, :portrait_upside_down]

  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))
  # Use `rake config' to see complete project settings, here are some examples:
  #
  # app.fonts = ['Oswald-Regular.ttf', 'FontAwesome.otf'] # These go in /resources
  # app.frameworks += %w(QuartzCore CoreGraphics MediaPlayer MessageUI CoreData)
  #
  # app.vendor_project('vendor/Flurry', :static)
  # app.vendor_project('vendor/DSLCalendarView', :static, :cflags => '-fobjc-arc') # Using arc
  #
  # app.pods do
  #   pod 'AFNetworking'
  #   pod 'SVProgressHUD'
  #   pod 'JMImageCache'
  # end
  app.interface_orientations = [:portrait]

  app.pods do
    pod 'NanoStore', '~> 2.6.0'
  end



end