task :init do
  check_dir 'Sources/Controllers', 'MainController.swift'
  check_dir 'Sources/Routings', 'MainRouting.swift'
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

def check_dir(path, default_file=nil)
    return if FileTest.exist?(path)
    FileUtils.mkdir_p(path)
    return if default_file.nil?
    `touch #{path}/#{default_file}`
end
