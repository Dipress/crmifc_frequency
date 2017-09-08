require 'mechanize'
require 'json'

class ScrapNodesTasks
  
  def self.cutdata
    mechanize = Mechanize.new
    nodes = BaseStation.all.map { |node| node.ip }.to_a.compact

    nodes.each do |n|
      login_page = mechanize.get "http://#{n}:85"
      form = login_page.forms.first
      form.field_with(id: 'username').value = "user"
      form.field_with(id: 'password').value = "password"
      form.submit
      
      data_hash = Hash.new
      data_hash = mechanize.get "http://#{n}:85/status.cgi"
      
      station = BaseStation.where(ip: n)

      actual_frequency = ActualFrequency.where(name: JSON.parse(data_hash.body)["wireless"]["frequency"].gsub(/\s\w{3}/, '')).map {|m| m.id }.first

      station.update(
        ssid: JSON.parse(data_hash.body)["host"]["hostname"],
        mac: JSON.parse(data_hash.body)["interfaces"][2]["hwaddr"],
        actual_frequency_id: actual_frequency
        )
    end
  end
end
