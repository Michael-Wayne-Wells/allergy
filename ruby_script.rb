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
FileUtils.cd('..')
FileUtils.mkdir_p("#{proj_name}/spec")
FileUtils.mkdir_p("#{proj_name}/lib")
FileUtils.cd("#{proj_name}")
File.write("#{proj_name}_script.rb", project.script)
File.write("lib/#{proj_name}.rb", project.ruby_lib)
File.write("spec/#{proj_name}_spec.rb", project.ruby_spec)
File.write("Gemfile", project.gem_file)
File.write("README.md", project.read_me)

Bundler.with_clean_env do
  `bundle install`
end
system("git init
git add .
git commit -m 'initial commit'
atom .")
