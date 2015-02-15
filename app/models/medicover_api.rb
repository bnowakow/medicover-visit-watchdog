require 'net/http'
require 'net/https'
require 'openssl'
require 'uri'


class MedicoverApi < ActiveRecord::Base

  def after_initialize
    uri = URI.parse("https://" + self.url)
    @https = Net::HTTP.new(uri.host, uri.port)
    @https.use_ssl = true
  end

  def post(request, retry_count = 0)

    # TODO fixme figure out why initialize isn't called
    self.after_initialize
    @retry_count = 0

    response = @https.start { |cx| cx.request(request) }
    responseJson = JSON.parse(response.body)

    if !responseJson || !responseJson['items'] || !responseJson['items'][0]
      # api token has expired - duh they return wrong data, not proper token expire message ~.~
      refresh_token
      # TODO fixme define retry_count in constructor instead of hardcode
      if retry_count < 3
        p "MedicoverApi retry_count=#{retry_count} for req=#{request}"
        return self.post(request, retry_count + 1)
      else
        return false
      end
    end

    return response
  end

  private
    def refresh_token
      requestRefresh = Net::HTTP::Post.new(self.refresh_token_path, initheader = {
                                                                           'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                                                                           'Content-Type' =>'application/x-www-form-urlencoded'

                                                                       })

      requestRefresh.body = "userNameOrEmail=#{self.username}&password=#{self.password}"
      respRefresh = @https.start { |cx| cx.request(requestRefresh) }
      token_regex = /\.ASPXAUTH=([^;]+).*$/
      if respRefresh && respRefresh['set-cookie'] && respRefresh['set-cookie'].match(token_regex)
        token = respRefresh['set-cookie'].match(token_regex)[1]
        self.token = token
        self.save
      end
    end
end
