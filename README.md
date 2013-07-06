twilio-twimlbin
=====================

## Overview
Twimlbin ruby wrapper class.  
You can use [twimlbin.com](http://twimlbin.com/) to host twilio markup language without your own server.

## Installation

`````
$ sudo gem install twilio-twimlbin
`````

## Usage

`````ruby
# -*- encoding: utf-8 -*-
require 'twilio-twimlbin'
require 'twilio-ruby'

response = Twilio::TwiML::Response.new do |r|
  r.Say 'Hello World', :voice => 'woman', :language => 'ja-jp'
end

twiml = Twimlbin.new
twiml.create(response.text)
puts twiml.external_url # print public url
puts twiml.private_url # print editable url
`````

## TODO
Pull requests are very welcome!!

## Articles

* Twilioのマークアップ言語TwiMLを無料ホスティングするサービス「twimlbin」をRubyから利用する「twilio-twimlbin」を公開しました  
http://y-ken.hatenablog.com/entry/twilio-twimlbin-gem-has-released

## Copyright
Copyright © 2013- Kentaro Yoshida ([@yoshi_ken](https://twitter.com/yoshi_ken))

## License
Apache License, Version 2.0

