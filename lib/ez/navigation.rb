require 'active_support/concern'

module Ez
  module Navigation
    extend ActiveSupport::Autoload
    MENUS, SUBMENU = ActiveSupport::OrderedHash.new, :nested_navigation

    autoload :Base
    autoload :Builder
    autoload :Error
    autoload :Menu
    autoload :Navigator
    autoload :NestedMenu
    autoload :Version

    module ControllerMethods
      def current_section(section = nil)
        self._current_section = section if section
        self._current_section
      end
    end

    module Helpers
      # renders the navigation identified by
      # the passed in name/key
      #
      # Ex:
      #  <%= navigation :primary %>
      #
      def navigation(key, options = {})
        options.merge!(:view => self)
        navigator = Navigator.new(key, options)
        if navigator.allowed?
          content_tag(:ul, navigator.links, options.merge!(:class => navigator.css_class))
        end
      end
    end

#    if defined?(Rails::Engine)
#      class Engine < Rails::Engine
#      end
#    end

    if defined?(Rails::Railtie)
      class Railtie < Rails::Railtie

        initializer 'ez-navigation' do |app|

          ActiveSupport.on_load(:action_controller) do
            ::ActionController::Base.class_eval do
              extend Ez::Navigation::ControllerMethods
              class_inheritable_accessor :_current_section
            end
          end

          ActiveSupport.on_load(:action_view) do
            ::ActionView::Base.class_eval do
              include Ez::Navigation::Helpers
            end
          end

        end

      end
    end

  end
end

