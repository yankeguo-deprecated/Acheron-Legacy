Pod::Spec.new do |s|
  s.name             =  'Acheron'
  s.version          =  '0.1.0'
  s.summary          =  'Joined forces of MKNetworkKit,JSONModel'
  s.homepage         =  'https://github.com/yanke_guo/Acheron'
  s.author           =  { 'YANKE Guo' => 'yanke.guo@icloud.com' }
  s.source           =  { :git => 'https://github.com/yanke_guo/Acheron.git', :tag => '0.1.0' }

  s.platform = :ios,'6.0'
  s.header_mappings_dir =  'Acheron/'
  s.requires_arc      =  true

  s.subspec 'Log' do |sp|
    sp.source_files = 'Sources/Log/*.{h,m}'
  end

  s.subspec 'Assert' do |sp|
    sp.source_files = 'Sources/Assert/*.{h,m}'
    sp.dependency 'Acheron/Log'
  end

  s.subspec 'Common' do |sp|
    sp.source_files = 'Sources/Common/*.{h,m}'
    sp.frameworks   = 'Security'
    sp.dependency 'Acheron/Log'
    sp.dependency 'Acheron/Assert'
  end

  s.subspec 'Network' do |sp|
    sp.source_files = 'Sources/Network/*.{h,m}'
    sp.frameworks   = 'CFNetwork', 'Security'
    sp.dependency 'Reachability', '~> 3.1.0'
    sp.dependency 'Acheron/Common'
  end

end
