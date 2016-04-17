Pod::Spec.new do |spec|
  spec.name         = 'LCFInfiniteScrollView'
  spec.version      = '0.1'
  spec.license      = 'MIT'
  spec.summary      = 'A Circular and Infinite Scroll View, Inspired by the App Store Banner View'
  spec.homepage     = 'https://github.com/leichunfeng/LCFInfiniteScrollView'
  spec.author       = { 'leichunfeng' => '307213080@qq.com' }
  spec.source       = { :git => 'https://github.com/leichunfeng/LCFInfiniteScrollView.git', :tag => 'v0.1' }
  spec.source_files = 'LCFInfiniteScrollView/LCFInfiniteScrollView/*.{h,m}'
  spec.requires_arc = true
  spec.platform     = :ios, '7.0'
  spec.dependency 'SDWebImage'
end