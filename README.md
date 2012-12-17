# vagrant-hostruby

Provision Vagrant boxes with Ruby (on the host machine).

## Install

Add this line to your `Gemfile`:

    gem "vagrant-hostruby"

And run:

    $ bundle install

Then, at the top of your `Vagrantfile` add:

    require "vagrant-hostruby"

## Why?

Why use `vagrant-hostruby` when Vagrant itself already provides an API for
writing provisioners in Ruby?

Because the `:hostruby` provisioner lets you write a "micro-provisioner",
straigt into your `Vagrantfile`.

For example:

    Vagrant::Config.run do |config|
    
      config.vm.box = "precise64"
      config.vm.box_url = "http://files.vagrantup.com/precise64.box"

      config.vm.network :hostonly, "192.168.48.10"

      config.vm.provision :hostruby, :provision => lambda { |env|
        system "ansible-playbook setup.yml --limit=myvm -vv --private-key=#{env[:vm].env.default_private_key_path}"
      }

    end
    
## Details

The `:hostruby` provisioner takes 3 optional arguments:

* `:prepare`
* `:provision`
* `:cleanup`

Each takes a `Proc` to be called at the named stage during provisioning, which
will be yielded the same `env` variable that Vagrant makes available to
provisioners.

## Copyright

The MIT License

Copyright (C) 2012 by Chris Berkhout (http://chrisberkhout.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

