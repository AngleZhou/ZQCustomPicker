#
#  Be sure to run `pod spec lint ZQCustomPicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "ZQCustomPicker"
  s.version      = "0.0.1"
  s.summary      = "A pop-up picker from the bottom of screen"
  s.homepage     = "https://github.com/AngleZhou"
  s.license      = "MIT"
  s.author       = { "AngleZhou" => "zhouq87724@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AngleZhou/ZQCustomPicker.git", :tag => "0.0.1" }
  s.source_files = 'ZQCustomPicker/*.{h,m}'
  s.preserve_paths = 'ZQCustomPickerDemo'
  s.framework    = 'UIKit'
end
