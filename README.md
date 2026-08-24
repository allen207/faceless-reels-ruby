# Faceless Reels Ruby

`faceless_reels` is a small Ruby client for the public endpoints exposed by
[Faceless Reels](https://faceless-reels.io), an AI-assisted workflow for
creating narrated vertical videos.

The gem currently supports service health checks and public showcase-video
URLs. It does not call private project APIs or submit video-generation jobs.

## Installation

Install the gem directly:

```shell
gem install faceless_reels
```

Or add it to your Gemfile:

```ruby
gem "faceless_reels"
```

## Usage

```ruby
require "faceless_reels"

client = FacelessReels::Client.new

client.ping
# => {"message"=>"pong"}

FacelessReels.homepage
# => "https://faceless-reels.io"

FacelessReels.showcase_video_url("shackleton")
# => "https://faceless-reels.io/api/public/showcase-videos/shackleton"
```

To convert service failures into a boolean health signal:

```ruby
client.available?
# => true or false
```

## Development

Run the tests:

```shell
bundle install
bundle exec rake test
```

Build the gem:

```shell
gem build faceless_reels.gemspec
```

## Links

- Website: <https://faceless-reels.io>
- Examples: <https://faceless-reels.io/examples>
- Source: <https://github.com/allen207/faceless-reels-ruby>
- RubyGems: <https://rubygems.org/gems/faceless_reels>

## License

The Ruby client in this repository is available under the MIT License.

