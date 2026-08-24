require_relative "test_helper"

class FacelessReelsTest < Minitest::Test
  Response = Struct.new(:code, :body)

  def test_exposes_product_metadata
    assert_equal "https://faceless-reels.io", FacelessReels.homepage
    assert_includes FacelessReels.summary, "Faceless Reels"
  end

  def test_builds_a_public_showcase_url
    assert_equal(
      "https://faceless-reels.io/api/public/showcase-videos/shackleton",
      FacelessReels.showcase_video_url("shackleton")
    )
  end

  def test_rejects_an_unsafe_showcase_id
    assert_raises(ArgumentError) do
      FacelessReels.showcase_video_url("../../private")
    end
  end

  def test_parses_the_ping_response
    client = FacelessReels::Client.new(
      http_get: lambda { |_uri| Response.new("200", '{"message":"pong"}') }
    )

    assert_equal({ "message" => "pong" }, client.ping)
    assert client.available?
  end

  def test_raises_a_typed_error_for_http_failures
    client = FacelessReels::Client.new(
      http_get: lambda { |_uri| Response.new("503", "Unavailable") }
    )

    error = assert_raises(FacelessReels::HTTPError) { client.ping }
    assert_equal 503, error.status
    refute client.available?
  end

  def test_rejects_an_invalid_base_url
    assert_raises(ArgumentError) do
      FacelessReels::Client.new(base_url: "javascript:alert(1)")
    end
  end
end

