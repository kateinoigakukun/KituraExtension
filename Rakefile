task :init do
  check_dir 'Sources/PageController', 'MainController.swift'
  check_dir 'Sources/Routing', 'MainRouting.swift'
  check_dir 'Sources/Views', 'MainView.swift'
  check_dir 'Sources/Views/html'
end

task :haml do
  compiled_path = 'Sources/Views/html'
  check_dir compiled_path
  Dir.glob('Sources/Views/*.haml').each do |file|
    `haml #{file} #{file.gsub(/\.haml/,".html").gsub(/Views/,"Views/html")}`
  end

end

def check_dir path
    FileUtils.mkdir_p(path) unless FileTest.exist?(path)
end
