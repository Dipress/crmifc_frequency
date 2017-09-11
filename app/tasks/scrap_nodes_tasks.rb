require 'mechanize'
require 'json'

class ScrapNodesTasks
  
  def self.cutdata
    mechanize = Mechanize.new
    nodes = BaseStation.all.map { |node| node.ip }.to_a.compact.sort

    nodes.each do |n|
      login_page = mechanize.get "http://#{n}:85"
      form = login_page.forms.first
      form.field_with(id: 'username').value = ENV["bs_login"]
      form.field_with(id: 'password').value = ENV["bs_password"]
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
    mechanize.shutdown
    sleep(10)
  end
end
