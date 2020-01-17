# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module PhoneAuthorizationHandler
    # This is the engine that runs on the public interface of phone_authorization_handler.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::PhoneAuthorizationHandler

      initializer "decidim.phone_authorization_handler" do
        require "decidim/exporters/serializer"
        require "decidim/exporters/csv"
        require "decidim/exporters/json"
        require "decidim/exporters/excel"
        require "decidim/proposals/proposal_serializer"
      end
      initializer "decidim_phone_authorization_handler.assets" do |app|
        app.config.assets.precompile += %w(decidim_phone_authorization_handler_manifest.css)
        end
    end
  end
end
