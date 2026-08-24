require_relative "faceless_reels/version"

module FacelessReels
  HOMEPAGE = "https://faceless-reels.io".freeze
  SUMMARY =
    "Turn story ideas into narrated vertical videos with Faceless Reels.".freeze

  class Error < StandardError; end

  class HTTPError < Error
    attr_reader :status

    def initialize(status)
      @status = status.to_i
      super("Faceless Reels returned HTTP #{@status}")
    end
  end
end

require_relative "faceless_reels/client"

module FacelessReels
  def self.homepage
    HOMEPAGE
  end

  def self.summary
    SUMMARY
  end

  def self.showcase_video_url(showcase_id)
    Client.new.showcase_video_url(showcase_id)
  end
end

