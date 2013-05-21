require 'helper'

class TwimlbinTest < Test::Unit::TestCase

  def test_publish
    twiml = Twimlbin.new
    external_url = twiml.create('twimlbin_ruby_unit_test')

    uri = URI.parse(external_url)
    req = Net::HTTP::Get.new(external_url)
    req.add_field('User-Agent', 'TwilioProxy')
    res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req) }

    assert_equal 'twimlbin_ruby_unit_test', res.body
  end

end

