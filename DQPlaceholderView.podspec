
    Pod::Spec.new do |s|  
      s.name             = "DQPlaceholderView"  
      s.version          = "1.0.0"  
      s.summary          = "空视图处理"
      s.homepage         = "https://github.com/dongqihouse/DQPlaceholderView"    
      s.license          = 'MIT'  
      s.author           = { "dq" => "244514311@qq.com" }  
      s.source           = { :git => "https://github.com/dongqihouse/DQPlaceholderView.git", :tag => s.version }   
      s.platform     = :ios, '8.0'   
      s.requires_arc = true  
      s.source_files = 'Source/*'   
      s.frameworks = 'Foundation', 'UIKit'  
      s.dependency 'Masonry'
      end
