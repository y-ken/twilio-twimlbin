class Twimlbin

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
    cookie = res.response['set-cookie'].split('; ')[0]
    @header = { "Cookie" => cookie }
    @token = res.response['Location'].scan(/[^\/]+$/).last
    @private_url = "http://twimlbin.com/#{@token}"
    @external_url = get_external_url
  end

  def get_external_url
    res = @http.get("/#{@token}", @header)
    find_url_regex = Regexp.escape('http://twimlbin.com/external/')
    regex = Regexp.new("(#{find_url_regex}[^<]+)")
    return res.body[regex]
  end

  def publish(xml)
    request = Net::HTTP::Post.new("/save_data", @header)
    body = {'index' => @token, 'twiml' => xml}
    request.set_form_data(body)
    begin
      return @http.request(request)
    rescue => e
      raise Gem::Exception, "Twimlbin: Error: #{e.message}"
    end
  end

end

