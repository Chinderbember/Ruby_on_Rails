# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:default)

class App
  attr_accessor :title, :description

  def self.call(_env)
    [200, { 'Content-Type' => 'text/html', 'X-Ruby-Version' => RUBY_VERSION }, ["RUBY_VERSION = #{RUBY_VERSION}"]]
  end
end

run App
