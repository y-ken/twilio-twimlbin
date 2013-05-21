twimlbin
=====================

## Overview
Twimlbin ruby wrapper class.  
You can use [twimlbin.com](http://twimlbin.com/) to host twilio markup language without your own server.

## Installation

`````
$ sudo gem install twimlbin
`````

## Usage

`````ruby
# -*- encoding: utf-8 -*-
require 'twimlbin'
require 'twilio-ruby'

response = Twilio::TwiML::Response.new do |r|
  r.Say 'Hello World', :voice => 'woman', :language => 'ja-jp'
end

twiml = Twimlbin.new
url = twiml.create(response.text)
puts url
`````

## TODO
Pull requests are very welcome!!

## Copyright
Copyright © 2013- Kentaro Yoshida ([@yoshi_ken](https://twitter.com/yoshi_ken))

## License
Apache License, Version 2.0

