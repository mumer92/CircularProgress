#
# Be sure to run `pod lib lint CircularProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'CircularProgress'
s.version          = '0.1.0'
s.summary          = 'CircularProgress that animates filling of circle by uring ratio value.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'Swift 3 library that creates a CircularProgress that animates while its bring drawn to screen with the ration given by and uses userdefines colors for inner and outer filling'

s.homepage         = 'https://github.com/mumer92/CircularProgress.git'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Muhammad Umer' => 'mumer92@gmail.com' }
s.source           = { :git => 'https://github.com/mumer92/CircularProgress.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/mumer92'

s.ios.deployment_target = '8.0'

s.source_files = 'CircularProgress/Classes/**/*'

# s.resource_bundles = {
#   'CircularProgress' => ['CircularProgress/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end
