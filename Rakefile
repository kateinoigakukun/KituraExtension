task :init do
  check_dir 'Sources/Controllers', 'MainController.swift'
  check_dir 'Sources/Routings', 'MainRouting.swift'
  check_dir 'Sources/Views'
  check_dir 'Sources/Views/mustache'
end

task :haml do
  compiled_path = 'Sources/Views/mustache'
  check_dir compiled_path
  Dir.glob('Sources/Views/*.haml').each do |file|
    `haml #{file} #{file.gsub(/\.haml/,".mustache").gsub(/Views/,"Views/mustache")}`
  end

end

def check_dir(path, default_file=nil)
    return if FileTest.exist?(path)
    FileUtils.mkdir_p(path)
    return if default_file.nil?
    `touch #{path}/#{default_file}`
end
