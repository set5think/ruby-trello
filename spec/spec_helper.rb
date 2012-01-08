require 'rubygems'

# Set up gems listed in the Gemfile.
begin
  ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
  require 'bundler'
  Bundler.setup
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end

Bundler.require(:spec)

require 'trello'
require 'webmock/rspec'

module Helpers
  def user_details
    {
      "id"       => "abcdef123456789012345678",
      "fullName" => "Test User",
      "username" => "me",
      "gravatar" => "abcdef1234567890abcdef1234567890",
      "bio"      => "a rather dumb user",
      "url"      => "https://trello.com/me"
    }
  end

  def user_payload
    Yajl::Encoder.encode(user_details)
  end

  def boards_details
    [{
      "id"             => "abcdef123456789123456789",
      "name"           => "Test",
      "desc"           => "This is a test board",
      "closed"         => false,
      "idOrganization" => "abcdef123456789123456789",
      "url"            => "https://trello.com/board/test/abcdef123456789123456789"
    }]
  end

  def boards_payload
    Yajl::Encoder.encode(boards_details)
  end

  def cards_details
    [{
      "id"        => "abcdef123456789123456789",
      "name"      => "Do something awesome",
      "desc"      => "Awesome things are awesome.",
      "closed"    => false,
      "idList"    => "abcdef123456789123456789",
      "idBoard"   => "abcdef123456789123456789",
      "idMembers" => ["abcdef123456789123456789"],
      "url"       => "https://trello.com/card/board/specify-the-type-and-scope-of-the-jit-in-a-lightweight-spec/abcdef123456789123456789/abcdef123456789123456789"
    }]
  end

  def cards_payload
    Yajl::Encoder.encode(cards_details)
  end

  def orgs_details
    [{
      "id"          => "abcdef123456789123456789",
      "name"        => "test",
      "displayName" => "Test Organization",
      "desc"        => "This is a test organization",
      "url"         => "https://trello.com/test"
    }]
  end

  def orgs_payload
    Yajl::Encoder.encode(orgs_details)
  end
end