class ApixuApi
  def self.weather_in(city)
    url = "https://api.apixu.com/v1/current.json?key=#{key}&q=#{city}"
    response = HTTParty.get url
    response.parsed_response['current']
  end

  def self.key
    raise "WEATHERMAPPING_APIKEY env variable not defined" if ENV['WEATHERMAPPING_APIKEY'].nil?

    ENV['WEATHERMAPPING_APIKEY']
  end
end
