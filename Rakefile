require "bundler"
Bundler.setup

gemspec = eval(File.read("wwdc.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["wwdc.gemspec"] do
  system "gem build wwdc.gemspec"
end
