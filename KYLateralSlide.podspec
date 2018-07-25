Pod::Spec.new do |s|
  s.name = 'KYLateralSlide'
  s.version = '1.0.0'
  s.ios.deployment_target = '10.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'swift 抽屉'
  s.homepage = 'https://github.com/KYangLei/KYLateralSlide.git'
  s.authors = { 'KYangLei' => '18683331614@163.com' }
  s.source = { :git => 'https://github.com/KYangLei/KYLateralSlide.git', :tag => s.version }
  s.description = '抽屉效果,只要一行代码就能拥有一个侧滑抽屉。'
  s.source_files = 'KYLateralSlide/*.swift'
  s.requires_arc = true
  s.frameworks = "Foundation","UIKit"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
end