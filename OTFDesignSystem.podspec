Pod::Spec.new do |s|
  s.name             = 'OTFDesignSystem'
  s.version          = '1.0.1-beta'
  s.summary          = 'A Design System for Health Applications'
  s.homepage         = 'https://github.com/TheraForge/OTFDesignSystem'
  s.license          = { :type => 'BSD-4', :file => 'LICENSE.md' }
  s.author           = { 'Hippocrates Technologies' => 'hippocratestech-dev@googlegroups.com' }
  s.source           = { :git => 'https://github.com/TheraForge/OTFDesignSystem.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.source_files = 'OTFDesignSystem/Sources/OTFDesignSystem/**/*'
  s.resources = 'OTFDesignSystem/Sources/OTFDesignSystem/**/*'
  s.preserve_paths = 'Scripts/*', 'Snippets/*'
  s.exclude_files = 'Snippets/*'
  
  # Triggers the script to install Code Snippets
  s.prepare_command = <<-CMD
    ruby -e "require 'pathname'; Pathname.new(File.expand_path('../Scripts/install_snippets.rb', __FILE__)).exist? ? load(File.expand_path('../Scripts/install_snippets.rb', __FILE__)) : abort('Error: install_snippets.rb not found')"
  CMD
end
