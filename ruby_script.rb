#!/usr/bin/ruby
require('./lib/ruby_files')
require('fileutils')
require('bundler')
art = File.read('./lib/art.txt')
puts art
puts "enter project name:"
proj_name = gets.chomp
puts "enter class name:"
my_class = gets.chomp
puts "enter method name"
my_method = gets.chomp
project = Template.new(my_class, my_method, proj_name)
puts "Sinatra y/n ?"
sinatra = gets.chomp

FileUtils.cd('..')
FileUtils.mkdir_p("#{proj_name}/spec")
FileUtils.mkdir_p("#{proj_name}/lib")
if sinatra === "y"
  FileUtils.mkdir_p("#{proj_name}/public")
  FileUtils.mkdir_p("#{proj_name}/views")
end
FileUtils.cd("#{proj_name}")
File.write("#{proj_name}_script.rb", project.script)
File.write("lib/#{proj_name}.rb", project.ruby_lib)
File.write("spec/#{proj_name}_spec.rb", project.ruby_spec)
File.write("Gemfile", project.gem_file)
File.write("README.md", project.read_me)
if sinatra === "y"
  File.write("app.rb", project.ruby_app)
  FileUtils.touch("views/layout.erb")
  FileUtils.touch("spec/#{proj_name}_integration_spec.rb")
end
Bundler.with_clean_env do
  `bundle install`
end
system("git init
git add .
git commit -m 'initial commit'
atom .")
