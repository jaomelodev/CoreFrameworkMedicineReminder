Pod::Spec.new do |spec|

  spec.name         = "CoreFramework"
  spec.version      = "0.0.1"
  spec.summary      = "Core Framework foi desenvolvido para fornecer componentes base para o Medicine Reminder"
  spec.description  = <<-DESC
    Core Framework foi desenvolvido para fornecer componentes base para o Medicine Reminder
  DESC
  spec.homepage     = "https://github.com/jaomelodev"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "João Mateus" => "joaomateusabm@yahoo.com.br" }
  spec.platform     = :ios, "12.0"
  spec.ios.deployment_target = "12.0"
  spec.swift_versions = ["5.0"]
  spec.source       = { :git => "https://github.com/jaomelodev/MedicineReminder.git", :tag => "#{spec.version}" }
  spec.source_files  = "CoreFramework/Sources/**/*.{swift,h}"
  spec.exclude_files = "Classes/Exclude"
  spec.frameworks = "UIKit"

end
