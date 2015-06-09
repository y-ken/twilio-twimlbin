class Twimlbin
  attr_reader :external_url, :private_url, :token

  def initialize
    require 'net/http'
  end

  def create(xml)
    configure
    return @external_url if publish(xml)
  end

  def configure
    @http = Net::HTTP.new('twimlbin.com', 80)
    res = @http.get('/create')
    @token = res.response['Location'].scan(/[^\/]+$/).last
    @private_url = "http://twimlbin.com/#{@token}"
    @external_url = get_external_url
  end

  def get_external_url
    res = @http.get("/#{@token}")
    find_url_regex = Regexp.escape('http://twimlbin.com/external/')
    regex = Regexp.new("(#{find_url_regex}[^<]+)")
    return res.body[regex]
  end

  def publish(xml)
    request = Net::HTTP::Post.new("/#{@token}/update")
    body = {'id' => @token, 'twiml' => xml}
    request.set_form_data(body)
    begin
      return @http.request(request)
    rescue => e
      raise Gem::Exception, "Twimlbin: Error: #{e.message}"
    end
  end
end

