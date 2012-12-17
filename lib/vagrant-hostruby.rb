require "vagrant-hostruby/version"

module Vagrant
  module Provisioners
    class Hostruby < Base

      class Config < Config::Base
        attr_accessor :prepare
        attr_accessor :provision
        attr_accessor :cleanup
      end

      def self.config_class
        Config
      end

      def prepare
        config.prepare.call(env) if config.prepare
      end

      def provision!
        config.provision.call(env) if config.provision
      end

      def cleanup
        config.cleanup.call(env) if config.cleanup
      end

    end
  end
end

Vagrant.provisioners.register(:hostruby, Vagrant::Provisioners::Hostruby)

