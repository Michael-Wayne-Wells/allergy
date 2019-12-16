class Template

  attr_reader(:ruby_lib, :ruby_spec, :gem_file, :read_me, :script, :ruby_app)
  attr_accessor(:my_class, :method, :title)
  def initialize(my_class, my_method, title)
    @my_class = my_class
    @my_method  = my_method
    @title = title
    @ruby_lib = "
    class #{my_class}
      def initialize
      end
      def #{my_method}()
        
      end
    end
    "

    @ruby_app =
    "require('sinatra')
    require('sinatra/reloader')
    require('./lib/#{title}')
    also_reload('lib/**/*.rb')
    get('/') do

    end
    get('/#{title}') do

    end

    get('/#{title}/new') do

    end

    get('/#{title}/:id') do

    end
    post('/#{title}') do

    end

    get('/#{title}/:id/edit') do

    end

    patch('/#{title}/:id') do

    end

    delete('/#{title}/:id') do

    end

    get('/custom_route') do

    end
    "

    @ruby_spec = "
    require('rspec')
    require('#{title}')

    describe(#{my_class}) do
    describe('##{my_method}') do
      it('test') do
        test = #{my_class}.new()
        expect(test.#{my_method}()).to(eq('test'))
      end
    end
  end
  "
  @gem_file = "
  source 'https://rubygems.org'
  gem 'sinatra'
  gem 'rspec'
  gem 'pry'
  gem 'fileutils'
  gem 'sinatra-contrib'"

  @script = "
  #!/usr/bin/ruby
  require('./lib/#{title}')
  "


  @read_me = "
  # _#{title}_

  #### _short description _

  #### By _**name**_

  ## Description

  _ _

  |Behavior|Input|Output|
  |---|---|---|
  |   |   |   |
  |   |   |   |
  |   |   |   |

  ## Setup/Installation Requirements

  * _Launch <https://url.io/(---------)> in your browser._
  ### OR ###
  * clone and open the file locally
  * _in terminal run:_
  >$git clone https://url/(------).git
  * _open index.html in your browser._



  ## Known Bugs

  _No known bugs_

  ## Support and contact details

  _If you have any issues with the program or want to reach out, email ['mwells1286@gmail.com](href='mailto:email@email.com')_

  ## Technologies Used

  _This program utilized:_
  * _RUBY_
  _and was built on Atom_
  ### License

  *Licensed under MIT license*

  Copyright (c) 2019 **_name_**
  "
end
end
