task :init do
  check_dir 'Sources/PageController'
  check_dir 'Sources/Routing'
  check_dir 'Sources/Views'
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
