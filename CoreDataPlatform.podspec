#
# Be sure to run `pod lib lint CoreDataPlatform.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreDataPlatform'
  s.version          = '1.0.1'
  s.summary          = 'A platform for CoreData manipulations.'

  s.description      = <<-DESC
  This pod includes protocols realization from Domain pod. Each service is accessible through ServiceProvider which is the only public class in the pod.
                       DESC

  s.homepage         = 'https://github.com/nmozhaev/Tasks-CoreDataPlatform'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nmozhaev' => 'mozhaevnick@gmail.com' }
  s.source           = { :git => 'https://github.com/nmozhaev/Tasks-CoreDataPlatform.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'CoreDataPlatform/Classes/**/*.{h,m,swift}'
  s.resources = 'CoreDataPlatform/Classes/Tasks.xcdatamodeld'
  
  s.swift_versions = '5.2'

  s.frameworks = 'CoreData'
  s.dependency 'Domain'
  
end
