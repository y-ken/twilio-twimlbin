require 'helper'

class TwimlbinTest < Test::Unit::TestCase

  def test_publish
  	test_xml = '<?xml version="1.0" encoding="UTF-8"?><Say>twimlbin_ruby_unit_test</Say>'
    twiml = Twimlbin.new
    external_url = twiml.create(test_xml)

    uri = URI.parse(external_url)
    req = Net::HTTP::Get.new(external_url)
    req.add_field('User-Agent', 'TwilioProxy')
    res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req) }

    assert_equal test_xml, res.body
  end
end
