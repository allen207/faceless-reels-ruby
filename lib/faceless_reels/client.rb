require "json"
require "net/http"
require "uri"

module FacelessReels
  class Client
    SHOWCASE_ID_PATTERN = /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/.freeze

    def initialize(base_url: HOMEPAGE, http_get: nil)
      @base_url = normalize_base_url(base_url)
      @http_get = http_get || lambda { |uri| Net::HTTP.get_response(uri) }
    end

    def ping
      response = @http_get.call(URI("#{@base_url}/api/ping"))
      raise HTTPError, response.code unless success?(response)

      JSON.parse(response.body)
    rescue JSON::ParserError => error
      raise Error, "Faceless Reels returned invalid JSON: #{error.message}"
    end

    def available?
      ping.fetch("message", nil) == "pong"
    rescue Error, SystemCallError, Timeout::Error
      false
    end

    def showcase_video_url(showcase_id)
      id = showcase_id.to_s
      unless SHOWCASE_ID_PATTERN.match?(id)
        raise ArgumentError, "Invalid showcase ID"
      end

      "#{@base_url}/api/public/showcase-videos/#{id}"
    end

    private

    def normalize_base_url(base_url)
      uri = URI(base_url.to_s)
      unless %w[http https].include?(uri.scheme) && uri.host
        raise ArgumentError, "base_url must be an HTTP or HTTPS URL"
      end

      base_url.to_s.sub(%r{/+\z}, "")
    end

    def success?(response)
      response.code.to_i.between?(200, 299)
    end
  end
end

